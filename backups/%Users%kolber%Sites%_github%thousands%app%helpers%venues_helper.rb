Vim�UnDo� y�R����T������܎�y96^|1#y�   V                 #       #   #   #    Q��4    _�                     3       ����                                                                                                                                                                                                                                                                                                                                                             Q�2�     �   2   4   V    5�_�                    3       ����                                                                                                                                                                                                                                                                                                                                                             Q�2�     �   2   4   W      8      "Within 1km"  => ->(distance) { distance <= 1.0 },5�_�                    3       ����                                                                                                                                                                                                                                                                                                                                                             Q�2�     �   2   4   W      7      "Within km"  => ->(distance) { distance <= 1.0 },5�_�                    3   9    ����                                                                                                                                                                                                                                                                                                                                                             Q�2�     �   2   4   W      9      "Within 500m"  => ->(distance) { distance <= 1.0 },5�_�                    3   4    ����                                                                                                                                                                                                                                                                                                                                                             Q�2�     �   2   4   W      9      "Within 500m"  => ->(distance) { distance <= 1.0 },5�_�                    3   4    ����                                                                                                                                                                                                                                                                                                                                                             Q�2�     �   2   4   W      8      "Within 500m"  => ->(distance) { distance <= .0 },5�_�                    3   4    ����                                                                                                                                                                                                                                                                                                                                                             Q�2�     �   2   4   W      7      "Within 500m"  => ->(distance) { distance <= 0 },5�_�      	              3   3    ����                                                                                                                                                                                                                                                                                                                                                             Q�2�     �   2   4   W    5�_�      
           	   3       ����                                                                                                                                                                                                                                                                                                                                                             Q�2�     �   2   4   X      9      "Within 500m"  => ->(distance) { distance <= 0.5 },5�_�   	              
   3   9    ����                                                                                                                                                                                                                                                                                                                                                             Q�2�    �   2   4   X      9      "Within 100m"  => ->(distance) { distance <= 0.5 },5�_�   
                 3   $    ����                                                                                                                                                                                                                                                                                                                                                             Q�2�     �   2   4   X    5�_�                    3       ����                                                                                                                                                                                                                                                                                                                            3          3          v       Q�2�     �   2   4   Y      9      "Within 100m"  => ->(distance) { distance <= 0.1 },5�_�                    3   8    ����                                                                                                                                                                                                                                                                                                                            3          3          v       Q�2�    �   2   4   Y      8      "Within 50m"  => ->(distance) { distance <= 0.1 },5�_�                    3       ����                                                                                                                                                                                                                                                                                                                            3          3          v       Q�2�    �   2   3          9      "Within 50m"  => ->(distance) { distance <= 0.05 },5�_�                           ����                                                                                                                                                                                                                                                                                                                            3          4          V       Q��     �               X   module VenuesHelper   !  def name_for_location(location)       if params[:l].present?   *      location.try(:address) || params[:l]   M    elsif params[:lat].present? && params[:lng].present? && location.present?         [location.city,   :        "#{location.state} #{location.postal_code}".strip,   ,        location.country].compact.join(", ")       end     end         def distance_away(distance)   %    if (distance = distance.to_f) < 1   ?      number_with_precision(distance * 100, precision: 0) + 'm'       else   :      number_with_precision(distance, precision: 1) + 'km'       end     end         def searching_for_location?       geolocation.present?     end         def group_venues(venues)   2    @grouped_venues ||= if searching_for_location?   '      group_venues_by_proximity(venues)       else   "      group_venues_by_time(venues)       end     end       &  def data_attributes_for_venue(venue)       {   #      lat: venue.data.location.lat,   "      lng: venue.data.location.lng       }     end       	  private       '  def group_venues_by_proximity(venues)   W    sort_into_groups(venues, proximity_groups, ->(venue) { venue.distance.to_f / 100 })     end       "  def group_venues_by_time(venues)   K    sort_into_groups(venues, time_groups, ->(venue) { venue.published_at })     end         def proximity_groups       {   9      "Within 100m"  => ->(distance) { distance <= 0.1 },   9      "Within 500m"  => ->(distance) { distance <= 0.5 },   8      "Within 1km"  => ->(distance) { distance <= 1.0 },   8      "Within 5km"  => ->(distance) { distance <= 5.0 },   9      "Within 10km" => ->(distance) { distance <= 10.0 },   9      "Within 20km" => ->(distance) { distance <= 20.0 },   7      "20km+ away"  => ->(distance) { distance > 20.0 }       }     end         def time_groups       {   M      "Added today"       => ->(time) { time >= 1.day.ago.beginning_of_day },   N      "Added this week"   => ->(time) { time >= 1.week.ago.beginning_of_day },   O      "Added last week"   => ->(time) { time >= 2.weeks.ago.beginning_of_day },   O      "Added this month"  => ->(time) { time >= 4.weeks.ago.beginning_of_day },   O      "Added last month"  => ->(time) { time >= 8.weeks.ago.beginning_of_day },   %      "Added in the last 6 months" =>   P                             ->(time) { time >= 6.months.ago.beginning_of_day },   '      "Added more than 6 months ago" =>   N                             ->(time) { time < 6.months.ago.beginning_of_day }       }     end       0  def sort_into_groups(venues, groups, callable)   E    venues_in_groups = Hash[groups.map { |group| [group.first, []] }]           venues.each do |venue|   +      group_match = groups.detect { |group|   -        group.last.call(callable.call(venue))         }       A      venues_in_groups[group_match.first] << venue if group_match       end       <    venues_in_groups.reject { |name, venues| venues.blank? }     end   end5�_�                           ����                                                                                                                                                                                                                                                                                                                            3          4          V       Q��    �         Y            �         X    5�_�                           ����                                                                                                                                                                                                                                                                                                                            4          5          V       Q��    �         Y            raise location.inspect5�_�                           ����                                                                                                                                                                                                                                                                                                                            4          5          V       Q��q     �         Y            raise location.street5�_�                           ����                                                                                                                                                                                                                                                                                                                            4          5          V       Q��r   	 �         Y            raise location.5�_�                           ����                                                                                                                                                                                                                                                                                                                            4          5          V       Q���     �               Y   module VenuesHelper   !  def name_for_location(location)       if params[:l].present?   *      location.try(:address) || params[:l]   M    elsif params[:lat].present? && params[:lng].present? && location.present?         raise location         [location.city,   :        "#{location.state} #{location.postal_code}".strip,   ,        location.country].compact.join(", ")       end     end         def distance_away(distance)   %    if (distance = distance.to_f) < 1   @      number_with_precision(distance * 1000, precision: 0) + 'm'       else   :      number_with_precision(distance, precision: 1) + 'km'       end     end         def searching_for_location?       geolocation.present?     end         def group_venues(venues)   2    @grouped_venues ||= if searching_for_location?   '      group_venues_by_proximity(venues)       else   "      group_venues_by_time(venues)       end     end       &  def data_attributes_for_venue(venue)       {   #      lat: venue.data.location.lat,   "      lng: venue.data.location.lng       }     end       	  private       '  def group_venues_by_proximity(venues)   Q    sort_into_groups(venues, proximity_groups, ->(venue) { venue.distance.to_f })     end       "  def group_venues_by_time(venues)   K    sort_into_groups(venues, time_groups, ->(venue) { venue.published_at })     end         def proximity_groups       {   9      "Within 100m"  => ->(distance) { distance <= 0.1 },   9      "Within 500m"  => ->(distance) { distance <= 0.5 },   8      "Within 1km"  => ->(distance) { distance <= 1.0 },   8      "Within 5km"  => ->(distance) { distance <= 5.0 },   9      "Within 10km" => ->(distance) { distance <= 10.0 },   9      "Within 20km" => ->(distance) { distance <= 20.0 },   7      "20km+ away"  => ->(distance) { distance > 20.0 }       }     end         def time_groups       {   M      "Added today"       => ->(time) { time >= 1.day.ago.beginning_of_day },   N      "Added this week"   => ->(time) { time >= 1.week.ago.beginning_of_day },   O      "Added last week"   => ->(time) { time >= 2.weeks.ago.beginning_of_day },   O      "Added this month"  => ->(time) { time >= 4.weeks.ago.beginning_of_day },   O      "Added last month"  => ->(time) { time >= 8.weeks.ago.beginning_of_day },   %      "Added in the last 6 months" =>   P                             ->(time) { time >= 6.months.ago.beginning_of_day },   '      "Added more than 6 months ago" =>   N                             ->(time) { time < 6.months.ago.beginning_of_day }       }     end       0  def sort_into_groups(venues, groups, callable)   E    venues_in_groups = Hash[groups.map { |group| [group.first, []] }]           venues.each do |venue|   +      group_match = groups.detect { |group|   -        group.last.call(callable.call(venue))         }       A      venues_in_groups[group_match.first] << venue if group_match       end       <    venues_in_groups.reject { |name, venues| venues.blank? }     end   end5�_�                           ����                                                                                                                                                                                                                                                                                                                            4          5          V       Q���     �         Y            raise location5�_�                           ����                                                                                                                                                                                                                                                                                                                            4          5          V       Q���   
 �         Y            raise locatio5�_�                           ����                                                                                                                                                                                                                                                                                                                            4          5          V       Q��     �                	      pry5�_�                           ����                                                                                                                                                                                                                                                                                                                            3          4          V       Q��    �         Y            �         X    5�_�                           ����                                                                                                                                                                                                                                                                                                                            4          5          V       Q��2    �         Y            raise location.inspect5�_�                            ����                                                                                                                                                                                                                                                                                                                            4          5          V       Q��a     �               Y   module VenuesHelper   !  def name_for_location(location)       if params[:l].present?   *      location.try(:address) || params[:l]   M    elsif params[:lat].present? && params[:lng].present? && location.present?         binding.pry         [location.city,   :        "#{location.state} #{location.postal_code}".strip,   ,        location.country].compact.join(", ")       end     end         def distance_away(distance)   %    if (distance = distance.to_f) < 1   @      number_with_precision(distance * 1000, precision: 0) + 'm'       else   :      number_with_precision(distance, precision: 1) + 'km'       end     end         def searching_for_location?       geolocation.present?     end         def group_venues(venues)   2    @grouped_venues ||= if searching_for_location?   '      group_venues_by_proximity(venues)       else   "      group_venues_by_time(venues)       end     end       &  def data_attributes_for_venue(venue)       {   #      lat: venue.data.location.lat,   "      lng: venue.data.location.lng       }     end       	  private       '  def group_venues_by_proximity(venues)   Q    sort_into_groups(venues, proximity_groups, ->(venue) { venue.distance.to_f })     end       "  def group_venues_by_time(venues)   K    sort_into_groups(venues, time_groups, ->(venue) { venue.published_at })     end         def proximity_groups       {   9      "Within 100m"  => ->(distance) { distance <= 0.1 },   9      "Within 500m"  => ->(distance) { distance <= 0.5 },   8      "Within 1km"  => ->(distance) { distance <= 1.0 },   8      "Within 5km"  => ->(distance) { distance <= 5.0 },   9      "Within 10km" => ->(distance) { distance <= 10.0 },   9      "Within 20km" => ->(distance) { distance <= 20.0 },   7      "20km+ away"  => ->(distance) { distance > 20.0 }       }     end         def time_groups       {   M      "Added today"       => ->(time) { time >= 1.day.ago.beginning_of_day },   N      "Added this week"   => ->(time) { time >= 1.week.ago.beginning_of_day },   O      "Added last week"   => ->(time) { time >= 2.weeks.ago.beginning_of_day },   O      "Added this month"  => ->(time) { time >= 4.weeks.ago.beginning_of_day },   O      "Added last month"  => ->(time) { time >= 8.weeks.ago.beginning_of_day },   %      "Added in the last 6 months" =>   P                             ->(time) { time >= 6.months.ago.beginning_of_day },   '      "Added more than 6 months ago" =>   N                             ->(time) { time < 6.months.ago.beginning_of_day }       }     end       0  def sort_into_groups(venues, groups, callable)   E    venues_in_groups = Hash[groups.map { |group| [group.first, []] }]           venues.each do |venue|   +      group_match = groups.detect { |group|   -        group.last.call(callable.call(venue))         }       A      venues_in_groups[group_match.first] << venue if group_match       end       <    venues_in_groups.reject { |name, venues| venues.blank? }     end   end5�_�                           ����                                                                                                                                                                                                                                                                                                                            4          5          V       Q���    �         Y          �         X    5�_�                            ����                                                                                                                                                                                                                                                                                                                                      	          v       Q��O     �      
          ,        location.country].compact.join(", ")�      	          :        "#{location.state} #{location.postal_code}".strip,�                      [location.city,5�_�                           ����                                                                                                                                                                                                                                                                                                                                      	          v       Q��P     �      	   Z            # �         Y    5�_�                            ����                                                                                                                                                                                                                                                                                                                            	                    v       Q��^    �         [            # Tim?5�_�      "                      ����                                                                                                                                                                                                                                                                                                                            	                    v       Q��x    �                    binding.pry5�_�       #   !       "          ����                                                                                                                                                                                                                                                                                                                                      
          v       Q��1     �                      # Tim, what do you think?5�_�   "               #           ����                                                                                                                                                                                                                                                                                                                                      	          V       Q��3    �                      # [location.city,   <      #   "#{location.state} #{location.postal_code}".strip,   .      #   location.country].compact.join(", ")5�_�               "   !          ����                                                                                                                                                                                                                                                                                                                                      
          v       Q���     �         Z            # 5�_�                    3        ����                                                                                                                                                                                                                                                                                                                            3          3          V       Q�32    �   2   5        5��