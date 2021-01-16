class Doctor
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name

        @@all.push(self)
    end

    def self.all
        @@all
    end

    def appointments
        Appointment.all.select {|appointments| appointments.doctor == self}
    end

    def new_appointment(date, patient)
        Appointment.new(date, patient, self)
    end

    def patients
        Appointment.all.select {|appointments| 
            appointments.doctor == self}.map {|appointment_instance| 
                appointment_instance.patient}
    end
end