class SfkQuestion
  def initialize
    @questions = ['Europa','Aufräumen','Berlin','Leberwurst']
    #perhaps refactor with attr_accessor rather then class variable
  end

  def randomQuestion
    @questions.sample
  end
end
