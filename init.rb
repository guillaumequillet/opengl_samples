require 'gosu'
require 'opengl'
require 'glu'

OpenGL.load_lib
GLU.load_lib

include OpenGL, GLU

require_relative 'obj_model.rb'

class Window < Gosu::Window
  def initialize
    super(640, 480, false)
    @test = ObjModel.new('test.obj')
  end

  def needs_cursor?; true; end

  def button_down(id)
    super
    close! if id == Gosu::KB_ESCAPE
  end

  def update

  end  

  def draw
    gl do
      glEnable(GL_TEXTURE_2D)
      glEnable(GL_DEPTH_TEST)
      glMatrixMode(GL_PROJECTION)
      glLoadIdentity
      gluPerspective(45, self.width.to_f / self.height, 1, 1000)
      glMatrixMode(GL_MODELVIEW)
      glLoadIdentity
      gluLookAt(0, 100, 100,  0, 0, 0,  0, 1, 0)
      @test.draw
    end
  end
end

Window.new.show