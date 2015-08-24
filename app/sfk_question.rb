class SfkQuestion
  def initialize
    @questions = ['Europa','Aufräumen','Berlin','Leberwurst']
  end

  def randomQuestion
    @questions.sample
  end
end
