User.destroy_all
Task.destroy_all
Garden.destroy_all
GardenUser.destroy_all

user1 = User.new(
  email: "a@a.a",
  password: "123456",
  first_name: "Ramy",
  last_name: "Sha",
  avatar_url: "https://avatars.githubusercontent.com/u/96581841?v=4",
  exp: 120,
  status: 1,
  seed_kind: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxEgfEKvxUHxc5m-br8DZsllKRMSn_NTcBLg&usqp=CAU"
)
user1.save!

  user2 = User.new(
    email: "c@c.c",
    password: "123456",
    first_name: "Julien",
    last_name: "Lozet",
    avatar_url: "https://avatars.githubusercontent.com/u/92589286?v=4",
    exp: 50,
    status: 1,
    seed_kind: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRzYnsUPk24xhVI6G24TdS6bTOl0GkIbZAmQ&usqp=CAU"
  )
  user2.save!

  user3 = User.new(
    email: "b@b.b",
    password: "123456",
    first_name: "Hadrien",
    last_name: "Reynders",
    avatar_url: "https://avatars.githubusercontent.com/u/82088724?v=4",
    exp: 10,
    status: 1,
    seed_kind: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTow8VmqTotMFzHCnL1TaWZsPNK8OTLq-Qb3w&usqp=CAU"
  )
  user3.save!

  #create new tasks

  task = Task.new(
    title: "Create a Printer Policy",
    description: "A printer policy, which could specify the instances where employees are allowed to print hard copies of documents and when they should opt for just digital copies instead. Use Earth Day as an opportunity to introduce this policy and explain the environmental benefits of cutting down on paper usage.",
    exp: 10
  )
  task.save!

  task = Task.new(
    title: "Reduce shower time by 2 min",
    description: "Reduce your shower time by 2 min",
    exp: 5
  )
  task.save!

  task = Task.new(
    title: "Don't eat meat for one day",
    description: "Believe it or not, cutting back on your consumption of meat can make a huge difference in the environment. ",
    exp: 10
  )
  task.save!

  task = Task.new(
    title: "Big spring cleaning... in your cleaning products",
    description: "Switch to 100% natural cleaning for a week",
    exp: 25
  )
  task.save!

  task = Task.new(
    title: "Caught red-handed",
    description: "Say goodbye to plastic bags for today",
    exp: 10
  )
  task.save!

  task = Task.new(
    title: "Give your waste to the worms",
    description: "Make your own compost",
    exp: 45
  )
  task.save!

  task = Task.new(
    title: "#NoFilter",
    description: "I remove coffee capsules for the week",
    exp: 15
  )
  task.save!

  task = Task.new(
    title: "Snif",
    description: "I quit the paper tissues for a day",
    exp: 5
  )
  task.save!

  task = Task.new(
    title: "VROOM",
    description: "Don't use your car for a day",
    exp: 15
  )
  task.save!

  task = Task.new(
    title: "Layer Up!",
    description: "Put on an extra layer of clothing instead of turning on the heating. Seriously, doubling up on your socks does wonders!",
    exp: 35
  )
  task.save!

  # create new gardens

  garden = Garden.new(
    name: "Parc des Tuilleries",
    user: user1
  )
  garden.save!

  garden = Garden.new(
    name: "Versailles's garden",
    user: user1
  )
  garden.save!

  garden = Garden.new(
    name: "Go-green's garden",
    user: user1
  )
  garden.save!

  #create garden users
    #garden 1

    garden_user = GardenUser.new(
      user_id: 1,
      garden_id: 1
    )
    garden_user.save!

    garden_user = GardenUser.new(
      user_id: 2,
      garden_id: 1
    )
    garden_user.save!

    garden_user = GardenUser.new(
      user_id: 3,
      garden_id: 1
    )
    garden_user.save!

    #garden 2

    garden_user = GardenUser.new(
      user_id: 1,
      garden_id: 2
    )
    garden_user.save!

    garden_user = GardenUser.new(
      user_id: 2,
      garden_id: 2
    )
    garden_user.save!

    #garden 3

    garden_user = GardenUser.new(
      user_id: 3,
      garden_id: 3
    )
    garden_user.save!
