# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Company.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!(Company.table_name)
Company.create([
                 {name: "Амазон", location: "Сиэтл"},
                 {name: "Купанг", location: "Сеул"},
                 {name: "Озон", location: "Москва"},
                 {name: "Вайлдберис", location: "Санкт-Петербург"}
               ])

Job.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!(Job.table_name)
Job.create([
             {name: "Маркетолог", place:"Сеул", company_id:"1"},
             {name: "Упаковщик товара", place:"Москва", company_id:"2"},
             {name: "Программист Go", place:"Москва", company_id:"3"},
             {name: "Системный администратор", place:"Сиэтл", company_id:"4"},
           ])

Geek.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!(Geek.table_name)
Geek.create([
              {name: "Юки", stack: "Маркетолог", resume: "true"},
              {name: "Марк", stack: "Системный администратор", resume: "false"},
              {name: "Рома", stack: "Программист Go", resume: "true"},
              {name: "Стас", stack: "Программист Go", resume: "false"}
            ])

Apply.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!(Apply.table_name)
Apply.create([
              {job_id: 1, geek_id: 1,read: true, invited: true },
              {job_id: 1, geek_id: 2,read: true, invited: true },
              {job_id: 4, geek_id: 2,read: true, invited: false },
              {job_id: 2, geek_id: 3,read: false, invited: false },
            ])