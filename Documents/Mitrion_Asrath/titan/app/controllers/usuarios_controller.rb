class UsuariosController < ApplicationController
  #reliza la ejecución de los métodos :set_usuario,
  before_action :set_usuario, except: %i[index new create]

  #realizar la muestra de todos los autos insertados en la base de datos
  def index
    @usuarios = Usuario.order('id').all
  end


  #Este método crea la instancia de la clase Auto
  def new

    @usuario= Usuario.new

  end

  def show; end

  #crea la inserción de un registro en la base de datos
  def create
    @usuario = Usuario.new(usuarios_params)
    #si los parametros establecidos en el formulario están correctos realizará la inserción
    if @usuario.save
      flash[:success] = 'Registro exitoso'

      redirect_to @usuario # está sentencia redirecciona a la ruta index
      #si no despliegará un mensaje de error
    else
      flash[:error] = @usuario.errors.full_messages.to_sentence
      render :new ## está sentencia redirecciona al mismo formulario
    end
  end

  #este método establece la edición a un contenido de la base de datos
  def update
    #si los parametros están correctos se realizará la edición
    if @usuario.update(usuarios_params)

      flash[:success] = 'Se han editado correctamente los datos'
      puts 'registro modificado'
      redirect_to @usuario
      #si no se despliega un mensaje de error
    else
      flash[:error] = 'No se puede editar el contenido'
      puts 'No se puede realizar ediciòn'
      render :edit
    end
  end

  #Este método realiza la eliminación de un elemento dentro de la base de datos
  def destroy
    @usuario.destroy
    flash[:success] = 'Elemento eliminado'
    puts 'elemento eliminado'
    redirect_to usuarios_path
  end

  private
  def usuarios_params
    params.require(:usuario).permit(:usrname,:email,:password,:password_confirmation)
    #if :password == :password_conf
     # flash[:success] = 'Las contraseñas coinciden'
    #else
     # flash[:error] = 'Las contraseñas no coinciden'
   # end*/
  end

  #Este método realiza la busqueda de los elementos por id
  def set_usuario
    @usuario = Usuario.find(params[:id])
  end

end