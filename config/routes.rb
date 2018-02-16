Rails.application.routes.draw do
	get 'todos', to: 'todos#index'
	root 'todos#index'

	post "/todos", to: "todos#create"
	get 'todos/new'
	get '/todos/list'

	get 'todos/:id', to: 'todos#show', as: 'todo' #--> esto es el prefijo
	get 'todos/:id/edit', to: 'todos#edit', as: 'edit_todo' #--> esto es el prefijo
	patch 'todos/:id', to: 'todos#update'

	delete 'todos/:id', to: 'todos#destroy', as: 'destroy_todo' #--> esto es el prefijo

	get '/todos/:id/complete', to: 'todos#complete', as: 'complete_todo'



	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
