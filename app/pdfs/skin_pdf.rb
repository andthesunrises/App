class SkinPdf < Prawn::Documents
  
  def initialize
    super
    text "This is a Vector PDF render for Minecraft Character"
  end
 
end
