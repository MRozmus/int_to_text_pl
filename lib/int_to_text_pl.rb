module Liczby

    JEDNOSTKI = {1 => "jeden", 2 => "dwa", 3 => "trzy", 4 => "cztery", 5 => "pięć", 6 => "sześć", 7 => "siedem", 8 => "osiem", 9 => "dziewięć"}
    DZIESIATKI = {1 => "dziesięć", 2 => "dwadzieścia", 3 => "trzydzieści", 4 => "czterdzieści", 5 => "pięćdziesiąt", 6 => "sześćdziesiąt", 7 => "siedemdziesiąt", 8 => "osiemdziesiąt", 9 => "dziewięćdziesiąt"}
    NASTKI = {1 => "jedenaście", 2 => "dwanaście", 3 => "trzynaście", 4 => "czternaście", 5 => "piętnaście", 6 => "szesnaście", 7 => "siedemnaście", 8 => "osiemnaście", 9 => "dziewiętnaście"}
    SETKI = {1 => "sto", 2 => "dwieście", 3 => "trzysta", 4 => "czterysta", 5 => "pięćset", 6 => "sześćset", 7 => "siedemset", 8 => "osiemset", 9 => "dziewięćset"}
    TYSIACE = {:one => "tysiąc", :few => "tysiące", :many => "tysięcy"}
    MILIONY = {:one => "milion", :few => "miliony", :many => "milionów"}
    MILIARDY = {:one => "miliard", :few => "miliardy", :many => "miliardów"}
 
     def nastki
         if (11..19).include?(self.to_s[-2..-1].to_i) then
             NASTKI[self.to_s[-1].to_i]
         else
             if self.to_s[-1].to_i == 0 then
                 DZIESIATKI[self.to_s[-2].to_i]
             else
                 "#{DZIESIATKI[self.to_s[-2].to_i]} #{JEDNOSTKI[self.to_s[-1].to_i]}"
             end
         end
     end
 
     def setki
         if self.to_s[-2..-1].to_i == 0 then
             SETKI[self.to_s[-3].to_i]
         else
             if self.to_s[-2].to_i == 0 then
                 "#{SETKI[self.to_s[-3].to_i]}#{nastki}"
             else
                 "#{SETKI[self.to_s[-3].to_i]} #{nastki}" 
             end
         end
     end
 
     def tysiace
        case self.to_s[0...-3].length
        when 1
            case self.to_s[0...-3].to_i
            when 1
                TYSIACE[:one]
            when 2, 3, 4
                TYSIACE[:few]
            else
                TYSIACE[:many]
            end
        else
            if (10..19).include?(self.to_s[-5...-3].to_i)
                TYSIACE[:many]
            else
                case self.to_s[-4...-3].to_i
                when 2, 3, 4
                    TYSIACE[:few]
                else
                    TYSIACE[:many]
                end
            end
        end
     end
 
     def miliony
        case self.to_s[0...-6].length
        when 1
            case self.to_s[0...-6].to_i
            when 1
                MILIONY[:one]
            when 2, 3, 4
                MILIONY[:few]
            else
                MILIONY[:many]
            end
        else
            if (10..19).include?(self.to_s[-8...-6].to_i)
                MILIONY[:many]
            else
                case self.to_s[-7...-6].to_i
                when 2, 3, 4
                    MILIONY[:few]
                else
                    MILIONY[:many]
                end
            end
        end
     end
 
     def miliardy
        case self.to_s[0...-9].length
        when 1
            case self.to_s[0...-9].to_i
            when 1
                MILIARDY[:one]
            when 2, 3, 4
                MILIARDY[:few]
            else
                MILIARDY[:many]
            end
        else
            if (10..19).include?(self.to_s[-11...-9].to_i)
                MILIARDY[:many]
            else
                case self.to_s[-10...-9].to_i
                when 2, 3, 4
                    MILIARDY[:few]
                else
                    MILIARDY[:many]
                end
            end
        end
     end
 
     def rep_f
         case self.to_s.length
         when 1
             JEDNOSTKI[self]
         when 2
             nastki
         when 3
             setki
         else
             raise "rep_f error"
         end
     end
 
     def main_f
         case self.to_s.length % 3 == 0 ? self.to_s.length / 3 - 1 : self.to_s.length / 3
         when 0
             if self == 0 then
                 "Zero"
             else
                 rep_f.capitalize
             end
         when 1
             "#{self.to_s[0...-3].to_i.rep_f} #{tysiace} #{self.to_s[-3..-1].to_i.rep_f}".capitalize.squeeze(' ').rstrip
         when 2
             "#{self.to_s[0...-6].to_i.rep_f} #{miliony} #{self.to_s[-6...-3].to_i.rep_f} #{tysiace if self.to_s[-6...-3].to_i != 0} #{self.to_s[-3..-1].to_i.rep_f}".capitalize.squeeze(' ').rstrip
         when 3
             "#{self.to_s[0...-9].to_i.rep_f} #{miliardy} #{self.to_s[-9...-6].to_i.rep_f} #{miliony if self.to_s[-9...-6].to_i != 0} #{self.to_s[-6...-3].to_i.rep_f} #{tysiace if self.to_s[-6...-3].to_i != 0} #{self.to_s[-3..-1].to_i.rep_f}".capitalize.squeeze(' ').rstrip
         else
             raise "Zbyt duża liczba -> main_f error"
         end
     end
 
 end
 
 class Integer
     include Liczby  
 
     def to_text_pl
         main_f
     end
 
 end