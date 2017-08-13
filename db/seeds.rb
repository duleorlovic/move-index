# we keep all variables (defined as :var) in global b hash
b = {}

# Activity
[
  { var: :activity_kayaking, name: 'Kayaking', description: 'All
    sports that include kayaking', icon_url: '' },
  { var: :activity_running, name: 'Running', description: 'All sports
    that include running', icon_url: '' },
  { var: :activity_cycling, name: 'Cycling', description: 'All'\
    ' sports hat include Cycling', icon_url: '' },
  { var: :activity_walking, name: 'Walking', description: 'All sports
    that include Walking', icon_url: '' },
  { var: :activity_rowwing, name: 'Rowwing', description: 'All sports
    that include Rowwing', icon_url: '' },
  { var: :activity_swimming, name: 'Swimming', description: 'All
    sports that include Swimming', icon_url: '' },
].each do |doc|
  r = Activity.where(doc.except(:var)).first_or_create! do |activity|
    puts "Activity #{activity.name}"
  end
  b[doc[:var]] = r if doc[:var]
end

# Sport
[
  { var: :sport_sprint_kayaking, name: 'Sprint Kayaking', description:
    'Olympic kayaking on flat water.  Includes everything from short distance
    (200m, 500m) to long marathong (15km)', icon_url: '', activities:
    [b[:activity_kayaking]] },
  { var: :sport_slalom_kayaking, name: 'Slalom Kayaking', description:
    'Kayaking on whitewater rivers', icon_url: '', activities:
    [b[:activity_kayaking]] },
  { var: :sport_recreational_kayaking, name: 'Recreational Kayaking',
    description: 'Kayaking everywhere', icon_url: '', activities:
    [b[:activity_kayaking]] },
  { var: :sport_long_running, name: 'Long Running', description: '5km,
  Half and Full Marathon races', icon_url: '', activities:
  [b[:activity_running]] },
  { var: :sport_sky_running, name: 'Sky Running', description: 'Uphill
  races', icon_url: '', activities: [b[:activity_running]] },
  { var: :sport_hiking, name: 'Hiking', description: 'All distances',
    icon_url: '', activities: [b[:activity_running], b[:activity_walking]] },
  { var: :spor_hiking_with_kids, name: 'Hiking with kids',
    description: 'Hiking with kids', icon_url: '', activities:
    [b[:activity_running], b[:activity_walking]] },
  { var: :sport_rowwing, name: 'Rowwing', description: 'All kinds of
    boats and distances', icon_url: '', activities: [b[:activity_rowwing]] },
  { var: :sport_triathlon, name: 'Triathlon', description: 'all
  distances', activities: [b[:activity_running], b[:activity_swimming],
                           b[:activity_cycling]] },
  { var: :sport_swimming, name: 'Swimming', description: 'Short
    distances', icon_url: '', activities: [b[:activity_swimming]] },
].each do |doc|
  r = Sport.where(doc.except(:activities, :var))
           .first_or_create! do |sport|
    puts "Sport #{sport.name}"
    sport.activities << doc[:activities]
  end
  b[doc[:var]] = r if doc[:var]
end

# Organization
[
  { var: :organization_my_personal, name: 'Duke', status:
    :personal },
  { var: :organization_my_kayak, name: 'Kayak club First', status:
    :registered_club },
  { var: :organization_kayak_second, name: 'Second kayak club',
    status: :registered_club },
  { var: :organization_athletic, name: 'Atletic Organization',
    status: :registered_club },
  { var: :organization_hiking, name: 'Mountain Organization',
    status: :registered_club },
  { var: :organization_triathlon, name: 'Triathlon Organization',
    status: :registered_club },
].each do |doc|
  r = Organization.where(
    doc.except(:var)
  ).first_or_create! do |discipline|
    puts "Organization #{discipline.name}"
  end
  b[doc[:var]] = r if doc[:var]
end

# Events
[
  { var: :event_my_long_kayaking, name: 'NS BG kayaking',
    starts_at: DateTime.parse('2017-05-01').utc, organization:
    b[:organization_my_personal] },
  { var: :event_first_kayak_reggate, name: "May's Kayak Reggata",
    starts_at: DateTime.parse('2017-05-01').utc, organization:
    b[:organization_my_kayak] },
  { var: :event_kayaking_long_second, name: 'Second Kayak Reggata',
    starts_at: DateTime.parse('2017-05-01').utc, organization:
    b[:organization_kayak_second] },
  { var: :event_swimming, name: 'Swimming Event Kanjiza',
    starts_at: DateTime.parse('2017-08-01').utc, website:
    'http://www.maratonkanjiza.rs/program-sr.html', organization:
    b[:organization_athletic] },
  { var: :event_hiking, name: '16km and 32km hiking event',
    starts_at: DateTime.parse('2017-08-01').utc, organization:
    b[:organization_hiking] },
  { var: :event_triatlon, name: 'Triatlon event',
    starts_at: DateTime.parse('2017-08-01').utc, organization:
    b[:organization_triathlon] },
].each do |doc|
  r = Event.where(doc.except(:var)).first_or_create! do |event|
    puts "Event #{event.name}"
  end
  b[doc[:var]] = r if doc[:var]
end

# Discipline
[
  { var: :discipline_k1500mMen, sport: b[:sport_sprint_kayaking],
    gender: :man, distance_m: 500, number_of_crew: 1, event:
    b[:event_first_kayak_reggate] },
  { var: :discipline_K41000Women, sport: b[:sport_sprint_kayaking],
    gender: :women, distance_m: 1_000, number_of_crew: 4, event:
    b[:event_first_kayak_reggate] },
  { var: :discipline_k2500mMen, sport: b[:sport_sprint_kayaking],
    gender: :man, distance_m: 500, number_of_crew: 2, event:
    b[:event_first_kayak_reggate] },
  { var: :discipline_k180000, sport: b[:sport_slalom_kayaking],
    distance_m: 80_000, event: b[:event_my_long_kayaking] },
  { var: :discipline_k115000m, sport: b[:sport_recreational_kayaking],
    distance_m: 15_000, event: b[:event_kayaking_long_second] },
  { var: :discipline_running_marathon, sport: b[:sport_long_running],
    distance_m: 42_125, event: b[:event_swimming] },
  { var: :discipline_sky30km, sport: b[:sport_sky_running],
    distance_m: 30_000, event: b[:event_hiking] },
  { var: :discipline_hikin16km, sport: b[:sport_hiking], distance_m:
    16_000, event: b[:event_hiking] },
  { var: :discipline_hiking32km, sport: b[:sport_hiking], distance_m:
    32_000, event: b[:event_hiking] },
  { var: :discipline_hiking2km, sport: b[:spor_hiking_with_kids],
    distance_m: 2_000, event: b[:event_hiking] },
  { var: :discipline_swimming570m09y, sport: b[:sport_swimming],
    gender: :man, distance_m: 570, age_min: 0, age_max: 9, event:
    b[:event_swimming] },
  { var: :discipline_swimming570w09y, sport: b[:sport_swimming],
    gender: :women, distance_m: 570, age_min: 0, age_max: 9, event:
    b[:event_swimming] },
  { var: :discipline_swimming570m911y, sport: b[:sport_swimming],
    gender: :man, distance_m: 570, age_min: 10, age_max: 11, event:
    b[:event_swimming] },
  { var: :discipline_swimming3000m010y, sport: b[:sport_swimming],
    gender: :man, distance_m: 3000, age_min: 0, age_max: 10, event:
    b[:event_swimming] },

  { var: :discipline_triathlon_olympic, sport: b[:sport_triathlon], gender:
    :man, event: b[:event_triatlon] },
  { var: :discipline_triathlon_olympic_swimming, sport: b[:sport_triathlon],
    gender: :man, event: b[:event_triatlon] },
  { var: :discipline_triathlon_olympic_bicycle, sport: b[:sport_triathlon],
    gender: :man, event: b[:event_triatlon] },
  { var: :discipline_triathlon_olympic_running, sport: b[:sport_triathlon],
    gender: :man, event: b[:event_triatlon] },
  { var: :discipline_triatlon_relay, sport: b[:sport_triathlon],
    event: b[:event_triatlon], number_of_crew: 3 },
  { var: :discipline_triatlon_relay_swimming, sport: b[:sport_triathlon],
    event: b[:event_triatlon] },
  { var: :discipline_triatlon_relay_bicycle, sport: b[:sport_triathlon],
    event: b[:event_triatlon] },
  { var: :discipline_triatlon_relay_running, sport: b[:sport_triathlon],
    event: b[:event_triatlon] },
  { var: :discipline_triatlon_running, sport: b[:sport_long_running],
    event: b[:event_triatlon] },
].each do |doc|
  r = Discipline.where(
    doc.except(:var)
  ).first_or_create! do |discipline|
    discipline.default_values_on_create
    puts "Discipline #{discipline.name}"
  end
  b[doc[:var]] = r if doc[:var]
end

# Race
[
  { var: :race_q1_k1500mMen, name: 'Qualification1 for
    k1500mMen', discipline: b[:discipline_k1500mMen], category:
    [:qualification] },
  { var: :race_q2_k1500mMen, name: 'Qualification2for
    k1500mMen', discipline: b[:discipline_k1500mMen], category:
    [:qualification] },
  { var: :race_f_k1500mMen, name: 'Final for
    k1500mMen', discipline: b[:discipline_k1500mMen], category:
    [:final] },
  { var: :race_f_k41000mWomen, name: 'Final for
  k41000mWomen', discipline: b[:discipline_K41000Women], category:
  [:final] },
  { var: :race_f_k2500mMen, name: 'Final for
    k2500mMen', discipline: b[:discipline_k2500mMen], category:
    [:final] },
  { var: :race_f_slalom, name: 'Final for kayak slalom', discipline:
  b[:discipline_k180000] },
  { var: :race_kayak_marathon, name: 'Final for
  kayak marathon', discipline: b[:discipline_k115000m] },
  { var: :race_running_maraton, name: 'Marathon running', discipline:
    b[:discipline_running_marathon] },
  { var: :race_sky30km, discipline: b[:discipline_sky30km] },
  { var: :race_hiking16km, discipline: b[:discipline_hikin16km] },
  { var: :race_hiking32km, discipline: b[:discipline_hiking32km] },
  { var: :race_hiking2km, discipline: b[:discipline_hiking2km] },
  { var: :race_swimming570m09y, discipline:
    b[:discipline_swimming570m09y] },
  { var: :race_swimming570w09y, discipline:
    b[:discipline_swimming570w09y] },
  { var: :race_swimming570m911y, discipline:
    b[:discipline_swimming570m911y] },
  { var: :race_swimming3000m010y, discipline:
    b[:discipline_swimming3000m010y] },

  { var: :race_triatlon_olimpic, discipline: b[:discipline_triathlon_olympic] },
  { var: :race_triatlon_relay, discipline: b[:discipline_triatlon_relay] },
  { var: :race_triatlon_relay_swimming, discipline:
    b[:discipline_triatlon_relay_swimming] },
  { var: :race_triatlon_relay_bicycle, discipline:
    b[:discipline_triatlon_relay_bicycle] },
  { var: :race_triatlon_relay_running, discipline:
    b[:discipline_triatlon_relay_running] },
  { var: :race_triatlon_running, discipline:
    b[:discipline_triatlon_running] },
].each do |doc|
  r = Race.where(doc.except(:var)).first_or_create! do |race|
    race.default_values_on_create
    puts "Race #{race.name}"
  end
  b[doc[:var]] = r if doc[:var]
end

# User
[
  { var: :my_user, email: 'my-user@trk.in.rs',
    password: 'asdfasdf' },
  { var: :kayaking_user, email: 'kayaking-user@trk.in.rs',
    password: 'asdfasdf' },
  { var: :user_running, email: 'running-user@trk.in.rs', password: 'asdfasdf' },
  { var: :user_swimming, email: 'swimming-user@trk.in.rs',
    password: 'asdfasdf' },
  { var: :user_bicycle, email: 'bicycle-user@trk.in.rs',
    password: 'asdfasdf' },
  { var: :user_triathlon, email: 'triathlon-user@trk.in.rs',
    password: 'asdfasdf' },
].each do |doc|
  r = User.where(doc.except(:var, :password)).first_or_create! do |user|
    user.password = doc[:password]
    user.confirm
    puts "User #{user.email}"
  end
  b[doc[:var]] = r if doc[:var]
end

# Registration
[
  { var: :registration_my_k1, user: b[:my_user],
    discipline: b[:discipline_k1500mMen] },
  { var: :my_k2_registration, user: b[:my_user],
    discipline: b[:discipline_k1500mMen] },
  { var: :kayaking_k1_registration, user: b[:kayaking_user], discipline:
    b[:discipline_k1500mMen] },
  { var: :kayaking_k2_registration, user: b[:kayaking_user], discipline:
    b[:discipline_k2500mMen] },
  { var: :registration_triathlon, user: b[:user_triathlon], discipline:
    b[:discipline_triathlon_olympic] },
  { var: :registration_triathlon_relay_swimming, user: b[:user_swimming],
    discipline: b[:discipline_triatlon_relay_swimming] },
  { var: :registration_triathlon_relay_running, user: b[:user_running],
    discipline: b[:discipline_triatlon_relay_running] },
  { var: :registration_triathlon_relay_bicycle, user: b[:user_bicycle],
    discipline: b[:discipline_triatlon_relay_bicycle] },
].each do |doc|
  r = Registration.where(doc.except(:var)).first_or_create! do |registration|
    puts "Registration #{registration.discipline}"
  end
  b[doc[:var]] = r if doc[:var]
end

# Participations and RegistrationParticipation
[
  { var: :participation_my_q1_k1500mMen, registrations:
    [b[:registration_my_k1]], race: b[:race_q1_k1500mMen] },
  { var: :participation_my_and_your_f_k2500mMen,
    registrations: [b[:my_k2_registration], b[:kayaking_k2_registration]], race:
    b[:race_f_k2500mMen] },

  { var: :participation_triatlon_olimpic, registrations:
    [b[:registration_triathlon]], race: b[:race_triatlon_olimpic] },
  { var: :participation_triatlon_relay_all, registrations:
    [b[:registration_triathlon_relay_swimming],
     b[:registration_triathlon_relay_running],
     b[:registration_triathlon_relay_bicycle]], race: b[:race_triatlon_relay] },
  { var: :participation_triatlon_relay_swimming, registrations:
    [b[:registration_triathlon_relay_swimming]], race:
    b[:race_triatlon_relay_swimming] },
  { var: :participation_triatlon_relay_running, registrations:
    [b[:registration_triathlon_relay_running]], race:
    b[:race_triatlon_relay_running] },
  { var: :participation_triatlon_relay_bicycle, registrations:
    [b[:registration_triathlon_relay_bicycle]], race:
    b[:race_triatlon_relay_bicycle] },
].each do |doc|
  r = Participation.where(
    doc.except(:var, :registrations)
  ).first_or_create! do |participation|
    participation.registrations = doc[:registrations] if doc[:registrations]
    puts "Participation #{participation.race}"
  end
  b[doc[:var]] = r if doc[:var]
end

# CheckPoint
[
  { var: :check_point_250m_of_500m, discipline: b[:discipline_k1500mMen],
    distance: 250, order: 1 },
  { var: :check_point_500m_of_500m, discipline: b[:discipline_k1500mMen],
    distance: 500, order: 2, final: true },
  { var: :check_point_triathlon_1500m_swimming, discipline:
    b[:discipline_triathlon_olympic], distance: 1500 },
  { var: :check_point_triathlon_40km_bicycle, discipline:
    b[:discipline_triathlon_olympic], distance: 1500 + 40_000 },
  { var: :check_point_triathlon_10km_running, discipline:
    b[:discipline_triathlon_olympic], distance: 1500 + 40_000 + 10_000 },
  { var: :check_point_triathlon_relay_180m_swimming, discipline:
    b[:discipline_triatlon_relay], distance: 180 },
  { var: :check_point_triathlon_relay_6600_bicycle, discipline:
    b[:discipline_triatlon_relay], distance: 6600 },
  { var: :check_point_triathlon_relay_1250m_running, discipline:
    b[:discipline_triatlon_relay], distance: 1250 },
].each do |doc|
  r = CheckPoint.where(doc.except(:var)).first_or_create! do |check_point|
    puts "CheckPoint #{check_point.distance}"
  end
  b[doc[:var]] = r if doc[:var]
end

# Result
[
  { participation: b[:participation_my_and_your_f_k2500mMen], check_point:
    b[:check_point_250m_of_500m], time_in_s: 45.234 },
  { participation: b[:participation_my_and_your_f_k2500mMen], check_point:
    b[:check_point_500m_of_500m], time_in_s: 133.34 },

  { participation: b[:participation_triatlon_olimpic], check_point:
    b[:check_point_triathlon_1500m_swimming], time_in_s: 200 },
  { participation: b[:participation_triatlon_olimpic], check_point:
    b[:check_point_triathlon_40km_bicycle], time_in_s: 400 },
  { participation: b[:participation_triatlon_olimpic], check_point:
    b[:check_point_triathlon_10km_running], time_in_s: 200 },

  { participation: b[:participation_triatlon_relay_all], check_point:
    b[:check_point_triathlon_relay_180m_swimming], time_in_s: 100 },
  { participation: b[:participation_triatlon_relay_swimming], check_point:
    b[:check_point_triathlon_relay_180m_swimming], time_in_s: 100 },
  { participation: b[:participation_triatlon_relay_all], check_point:
    b[:check_point_triathlon_relay_1250m_running], time_in_s: 200 },
  { participation: b[:participation_triatlon_relay_running], check_point:
    b[:check_point_triathlon_relay_1250m_running], time_in_s: 200 },
  { participation: b[:participation_triatlon_relay_all], check_point:
    b[:check_point_triathlon_relay_6600_bicycle], time_in_s: 300 },
  { participation: b[:participation_triatlon_relay_bicycle], check_point:
    b[:check_point_triathlon_relay_6600_bicycle], time_in_s: 300 },

].each do |doc|
  r = Result.where(doc.except(:var)).first_or_create! do |result|
    puts "Result #{result.time_in_s}"
  end
  b[doc[:var]] = r if doc[:var]
end
