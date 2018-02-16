class TodosController < ApplicationController
	
	def index
		@todos = Todo.all.order(description: :asc)
	end
	
	def new
		@todo = Todo.new
	end
	
	def show
		@todo = Todo.find(params[:id])
	end
	
	def edit
		@todo = Todo.find(params[:id])
	end
	
	
	def create
		@todo = Todo.new(todo_params)
		@todo.completed = false #guarda por default false
		
		if @todo.save
			redirect_to @todo, notice: 'Se creó el ToDo satisfactoriamente!!!'
		else
			redirect_to todos_new_path, notice: '******No se pudo crear el ToDo, Favor corrobore el Campo!!!!!******'
		end
	end
	
	
	def update
		@todo = Todo.find(params[:id])
		if @todo.update(todo_params)
			redirect_to root_path, notice: 'Se ha actualizado con éxito!!'
		else
			redirect_to edit_post_path(@post.id), notice: 'No se ha podido actualizar :('
		end
	end
	
	def destroy
		@todo = Todo.find(params[:id])
		@todo.destroy
		redirect_to root_path, notice: 'ToDo se ha eliminado con éxito!!'
	end

	def complete
		@todo = Todo.find(params[:id])
		if @todo.update(completed: true)
			redirect_to root_path, notice: 'Se ha actualizado con éxito!!'
		end
	end

	def list
		@todos = Todo.all.order(description: :asc)
	end

	
	
	private
	def todo_params
		params.require(:todo).permit(:description)
	end
	
	
end
