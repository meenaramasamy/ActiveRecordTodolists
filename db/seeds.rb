
User.destroy_all
TodoList.destroy_all
TodoItem.destroy_all
Profile.destroy_all

user_list = [
              ["Carly", "Fiorina", "female", 1954],
              ["Donald", "Trump", "male", 1946],
              ["Ben", "Carson", "male", 1951],
              ["Hillary", "Clinton", "female", 1947]
        ]

User.create! [
{username: "Fiorina" , password_digest: "234"},
{username: "Trump" , password_digest: "890"},
{username: "Carson" , password_digest: "123"},
{username: "Clinton" , password_digest: "123"}
]

user_list.each do |fname, lname, gender, byear|
User.find_by!(username: lname).create_profile(gender: gender, birth_year: byear, first_name: fname, last_name: lname)
end
duedate = Date.today + 1.year	

user_list.each do |fname, lname, gender, byear|
	u= User.find_by!(username: lname)
	t = TodoList.create!(list_name: fname, list_due_date: duedate)
	u.todo_lists << t
  end
  tlist = TodoList.all
  tlist.each do |list|
 5.times do
 list.todo_items.create!(due_date: duedate, title:"FP",description:"Finish Program")
 end
end
