class SfkQuestionsViewController < UIViewController
  #there seem to be a bunch of standard view controller methods
  def loadView
    self.view = UIImageView.alloc.init
  end

  def viewDidLoad
    view.image = UIImage.imageNamed('epikouros.jpg') #needs to be compressed
    # view.image = CGRect(10,10,30,30); #images go in resources file
    @label = makeQuestionLabel
    view.addSubview(@label)

    view.userInteractionEnabled = true
    recognizer = UITapGestureRecognizer.alloc.initWithTarget(self, action:'showAQuestion')
    view.addGestureRecognizer(recognizer)

    @sfkQuestion = SfkQuestion.new  #all classes in app folder are automatically required
  end

  def showAQuestion
    @label.text = @sfkQuestion.randomQuestion
  end

  def makeQuestionLabel
    label = UILabel.alloc.initWithFrame([[10,60],[300,80]])
    label.backgroundColor = UIColor.lightGrayColor
    label.text = ['Europa','Aufräumen','Berlin','Leberwurst'].sample
    label.font = UIFont.boldSystemFontOfSize(34)
    label.textColor = UIColor.darkGrayColor
    label.textAlignment = UITextAlignmentCenter
    label
  end
end
