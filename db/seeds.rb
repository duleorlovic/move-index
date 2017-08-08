[
  { name: 'Kayaking', description: 'All sports that include kayaking', icon_url:
    '' },
  { name: 'Running', description: 'All sports that include running', icon_url:
    '' },
  { name: 'Swimming', description: 'All sports that include Swimming', icon_url:
    '' },
  { name: 'Cycling', description: 'All sports that include Cycling', icon_url:
    '' },
  { name: 'Walking', description: 'All sports that include Walking', icon_url:
    '' },
  { name: 'Rowwing', description: 'All sports that include Rowwing', icon_url:
    '' },
  { name: 'Swimming', description: 'All sports that include Swimming', icon_url:
    '' },
].each do |doc|
  Activity.where(doc).first_or_create do |activity|
    puts "Activity #{activity.name}"
  end
end

kayaking_activity = Activity.find_by name: 'Kayaking'
running_activity = Activity.find_by name: 'Running'
cycling_activity = Activity.find_by name: 'Cycling'
walking_activity = Activity.find_by name: 'Walking'
rowwing_activity = Activity.find_by name: 'Rowwing'
swimming_activity = Activity.find_by name: 'Swimming'

[
  { name: 'Sprint Kayaking', description: 'Olympic kayaking on flat water.
    Includes everything from short distance (200m, 500m) to long marathong
    (15km)', icon_url: '', activities: [kayaking_activity] },
  { name: 'Whitewater Kayaking', description: 'Kayaking on rivers', icon_url:
    '', activities: [kayaking_activity] },
  { name: 'Long Running', description: '5km, Half and Full Marathon races',
    icon_url: '', activities: [running_activity] },
  { name: 'Rowwing', description: 'All kinds of boats and distances', icon_url:
    '', activities: [rowwing_activity] },
  { name: 'Thriatlon', description: 'all distances', activities:
    [running_activity, swimming_activity, cycling_activity] },
  { name: 'Hiking', description: 'All distances', icon_url: '', activities:
    [running_activity, walking_activity] },
].each do |doc|
  Sport.where(doc.except(:activities)).first_or_create do |sport|
    puts "Sport #{sport.name}"
    sport.activities << doc[:activities]
  end
end
