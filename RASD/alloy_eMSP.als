//abstract sig String {}
abstract sig Bool {}
one sig TRUE extends Bool {}
one sig FALSE extends Bool {}


sig ConnectorType {}
sig Device {} {
	(one u: User | this in u.devices) and -- device needs a user
	(no disj u, u': User | this in u.devices & u'.devices) -- no device can be owned by multiple users
}

sig LicensePlate {} {
	(one v: Vehicle | v.licensePlate = this) -- licence is used only as string here so cannot exists without a vehicle
}
sig Vehicle {
	licensePlate: one LicensePlate,
	connector: one ConnectorType
} {
	(one u: User | this in u.vehicles) and -- vehicle needs a user
	(no disj u, u': User | this in u.vehicles & u'.vehicles) -- no vehicle can be owned by multiple users
}

sig User {
	devices: set Device,
	vehicles: set Vehicle,
	bookings: set Booking
} {
	#devices > 0 and #vehicles > 0
}


sig CPMS {
	chargingPoints: set ChargingPoint
} {
 	#chargingPoints > 0
}

sig ChargingSlot {
	connectors: set ConnectorType
} {
	(one cp: ChargingPoint | this in cp.chargingSlots) and -- charging slot needs to be in a charging point
	(no disj cp, cp': ChargingPoint | this in cp.chargingSlots & cp'.chargingSlots) and -- a charging slot cannot be in multiple charging points
	(#connectors > 0)
}

sig ChargingPoint {
	tariffs: set Tariff,
	chargingSlots: set ChargingSlot
} {
	 (one cpms: CPMS | this in cpms.chargingPoints) and -- charging point needs a CPMS
	 (no disj cpms, cpms': CPMS | this in cpms.chargingPoints & cpms'.chargingPoints) and -- charging point cannot have multiple CPMS
	 (#tariffs > 0) and (#chargingSlots > 0)
}

sig Tariff {
	startAt: one Int,
} {
 	(startAt > 0) and  -- dates as timestamps so they need to be > 0
	(one c: ChargingPoint | this in c.tariffs) and -- tariff needs a charging point
	(no disj c, c': ChargingPoint | this in c.tariffs & c'.tariffs) -- no tariff can be used for multiple charging point
}

sig BookingStatus {
	
}

sig Booking {
	status: one BookingStatus,
	vehicle: one Vehicle,
	slot: one ChargingSlot,
	payments: set Payment
} {
	(one user: User | this in user.bookings and vehicle in user.vehicles) and -- booking needs a user and vehicle must be owned by the same user
	(no disj u, u': User | this in u.bookings & u'.bookings) and
	(no disj p, p': payments | p.status.isFinal = TRUE and p'.status.isFinal = TRUE) -- only one successful payment must happen for a single booking
}

sig PaymentStatus {
	isFinal: one Bool
}
sig PaymentType {}

sig PaymentProvider {
	payments: set Payment
}

sig Payment {
	timestamp: one Int,
	status: PaymentStatus,
	type: PaymentType
} {
	(timestamp > 0) and
	(one provider: PaymentProvider | this in provider.payments) and -- payment needs a provider
	(no disj p, p': PaymentProvider | this in p.payments & p'.payments) and -- only one provider per payment
	(one booking: Booking | this in booking.payments) and -- payment needs a booking
	(no disj b, b': Booking | this in b.payments & b'.payments) -- only one booking for payment
}

/** ---- FACTS ---- */
fact noDifferentVehiclesWithSameLicensePlate {
	no disj v, v': Vehicle |
		v.licensePlate = v'.licensePlate
}

fact noMultipleTarrifsWithSameStartAtForTheSameChargingPoint {
	all cp: ChargingPoint |
		no disj t, t': cp.tariffs | t.startAt = t'.startAt
}

fact noPaymentsAfterASuccessfulOne {
	no disj p, p': Payment | (
		p.timestamp < p'.timestamp 
		and p.status.isFinal = TRUE
	)
}

/** ---- ASSERTIONS ---- */
assert deviceHasOneUser {
	no d: Device, u, u': User |	
		u != u' and
		d in u.devices and d in u'.devices
	and
	all d: Device |
		one u: User | d in u.devices
}

check deviceHasOneUser

assert bookingHasOnlyOnePaymentWithFinalStatus {
	all b: Booking |
		no p, p': Payment | (p != p' and p in b.payments and p' in b.payments and 
			p.status.isFinal = TRUE and p'.status.isFinal = TRUE
		)
}

check bookingHasOnlyOnePaymentWithFinalStatus

/** ---- PREDICATES ---- */

pred noCPMSInsertedWorld {
	#User > 0 and
	#CPMS = 0
}
run noCPMSInsertedWorld for 5

pred world1 {
	#User = 1
	#Payment  > 0
}
run world1 for 5

pred world2 {
	#User > 1 and
	#CPMS > 1 and
	#Booking > 1 and
	#Payment  > 1 and
	(some b: Booking | #b.payments > 1 and one p: b.payments | p.status.isFinal = TRUE) and
	(some cp: ChargingPoint | #cp.tariffs > 1 and #cp.chargingSlots > 1)
}
run world2 for 5
