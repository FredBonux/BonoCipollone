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
	chargingPoints: set ChargingPoint,
	tariffs: set Tariff,
} {
 	(#chargingPoints) > 0 and
	(#tariffs > 0)
}

sig ChargingSocket {
	isFast: one Bool,
	connectorType: one ConnectorType
} {
	(one slot: ChargingSlot | this in slot.sockets) and -- sockets needs to have one slot connected
	(no disj s, s': ChargingSlot | this in s.sockets & s'.sockets) -- no multiple slots for the same socket
}

sig ChargingSlot {
	sockets: set ChargingSocket
} {
	(one cp: ChargingPoint | this in cp.chargingSlots) and -- charging slot needs to be in a charging point
	(no disj cp, cp': ChargingPoint | this in cp.chargingSlots & cp'.chargingSlots) and -- a charging slot cannot be in multiple charging points
	(#sockets > 0)
}

sig ChargingPoint {
	chargingSlots: set ChargingSlot
} {
	 (one cpms: CPMS | this in cpms.chargingPoints) and -- charging point needs a CPMS
	 (no disj cpms, cpms': CPMS | this in cpms.chargingPoints & cpms'.chargingPoints) and -- charging point cannot have multiple CPMS
	 (#chargingSlots > 0)
}

sig Tariff {
	startAt: one Int,
	fastCharge: one Bool,
} {
 	(startAt > 0) and  -- dates as timestamps so they need to be > 0
	(one cpms: CPMS | this in cpms.tariffs) and -- tariff needs a CPMS
	(no disj c, c': CPMS | this in c.tariffs & c'.tariffs) -- no tariff can be used for multiple CPMS
}

sig BookingStatus {
	
}

sig Booking {
	status: one BookingStatus,
	vehicle: one Vehicle,
	slot: one ChargingSlot,
} {
	(one user: User | this in user.bookings and vehicle in user.vehicles) and -- booking needs a user and vehicle must be owned by the same user
	(no disj u, u': User | this in u.bookings & u'.bookings) 
}


/** ---- FACTS ---- */
fact noDifferentVehiclesWithSameLicensePlate {
	no disj v, v': Vehicle |
		v.licensePlate = v'.licensePlate
}


fact noMultiplePricingActiveAtTheSameTimeForTheSameCPMS {
	all cpms: CPMS | (
		no disj t, t': cpms.tariffs | (
			t.startAt = t'.startAt and
			t.fastCharge = t'.fastCharge
		)
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


assert noMultiplePricingActiveAtTheSameTimeForTheSameCPMS {
	no disj t, t': Tariff | (
		t.~tariffs = t'.~tariffs and t.startAt = t'.startAt and t.fastCharge = t'.fastCharge
	)
}

check noMultiplePricingActiveAtTheSameTimeForTheSameCPMS

/** ---- PREDICATES ---- */

pred noCPMSInsertedWorld {
	#User > 0 and
	#CPMS = 0
}
run noCPMSInsertedWorld for 5

pred world1 {
	#User = 1
}
run world1 for 5

pred world2 {
	#User > 1 and
	#CPMS > 1 and
	#Booking > 1 and
	(some cpms: CPMS | #cpms.tariffs > 1)
}
run world2 for 5
