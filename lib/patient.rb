require 'pry'

class Patient
    attr_accessor :name
    
    @@all = []

    def initialize(name)
        @name = name

        @@all.push(self)
    end

    def self.all
        @@all
    end

    def new_appointment(date, doctor)
        Appointment.new(date, self, doctor)
    end

    def appointments
        Appointment.all.select {|appointments| appointments.patient == self}
    end

    def doctors
        Appointment.all.select {|appointments| 
            appointments.patient == self}.map {|appointment_instance| 
                ppointment_instance.doctor}
    end
end

