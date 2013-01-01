When /^I check the presence$/ do
  visit groups_path
  click_link 'Classes'
  click_link 'Check Presence'
  @presences=Array.new {Array.new(3)} 
  n=0
  @students.each do |student|
  if rand(2) == 1
  check("presence_#{student.id}")
  @presences[n]=[student.name,student.surname,'present']
  else
  uncheck("presence_#{student.id}")
  @presences[n]=[student.name,student.surname,'absent']
  end
  n +=1
  end
  click_button('Check presence')
  page.should have_content('Presence Checked!')
end

Then /^I should see list of presence\.$/ do
  click_link ('Presence')

  rows = find("table#product-table").all('tr')

  @presences.each do |presence|
  finded = false

  rows.each do |tr|
    if tr.has_content?(presence[0]) && tr.has_content?(presence[1]) && (tr.should have_selector("img[alt$='#{presence[2]}']"))
      finded = true
      break
    end
  end
  finded.should == true
  end

end



When /^I checked the presences$/ do
  @presences=Array.new(@students.count) { Array.new(@labclasses.count+2) }

  m=2
  @labclasses.each do |lab_class|
  visit groups_path
  click_link 'Classes'
  click_link "check_presence_lab_class_#{lab_class.id}"

  n=0
  @students.each do |student|
  @presences[n][0]=student.name
  @presences[n][1]=student.surname
  if rand(2) == 1
  check("presence_#{student.id}")
  @presences[n][m] = 'P'
  else
  uncheck("presence_#{student.id}")
  @presences[n][m] = 'A'
  end
  n +=1
  end
  click_button('Check presence')
  page.should have_content('Presence Checked!')
  m+=1
  end

end

Then /^I should see all presences on the presences group list$/ do
  visit groups_path
  click_link 'Presence'
  rows = find("table#product-table").all('tr')
  @table = rows.map { |r| r.all('th,td').map { |c| c.text.strip } }
  @table.delete_at(0)
  diff=true
  if (@table - @presences).empty?
  diff=false
  end
  diff.should == false
end

