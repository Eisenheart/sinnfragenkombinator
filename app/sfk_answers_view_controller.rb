class SfkAnswersViewController < UIViewController
  def loadView
    self.view = UIImageView.alloc.init
    self.title = 'SFK - Fragen'
  end

  def viewDidLoad
    super #not sure what it does?
    view.image = UIImage.imageNamed('epikouros.jpg') #needs to be compressed

    @labelIst = makeLabelIst(10,60,40,40)
    @labelSubject = makeLabel(50,60,150,40)
    @labelSecondPart = makeLabel(120,60,200,40)
    @labelQuestionMark = makeLabelQuestionMark(250,60,20,40)

    view.addSubview(@labelIst)
    view.addSubview(@labelSubject)
    view.addSubview(@labelSecondPart)
    view.addSubview(@labelQuestionMark)

    view.userInteractionEnabled = true
    recognizer = UITapGestureRecognizer.alloc.initWithTarget(self, action:'showAQuestion')
    view.addGestureRecognizer(recognizer)

    @sfkQuestion = SfkQuestion.new  #all classes in app folder are automatically required

    #creates a button_alt including touch animation, referenced action not created yet
    button_width = 80
    button_alt = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    button_alt.setTitle("Alternative Antwort", forState:UIControlStateNormal)
    button_alt.setTitleColor(UIColor.send("blueColor"), forState:UIControlStateNormal)
    button_alt.sizeToFit
    button_alt.frame = CGRectMake(10,200,150,100)
    # button_alt.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin
    button_alt.addTarget(self,action:"refresh_answers",forControlEvents:UIControlEventTouchUpInside)
    self.view.addSubview(button_alt)

    #creates a button_answer including touch animation, referenced action not created yet
    button_answer = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    button_answer.setTitle("Zu Fragen", forState:UIControlStateNormal)
    button_answer.setTitleColor(UIColor.send("blueColor"), forState:UIControlStateNormal)
    button_answer.sizeToFit
    button_answer.frame = CGRectMake(10,100,100,100)
    # button_answer.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin
    button_answer.addTarget(self,action:"show_questions",forControlEvents:UIControlEventTouchUpInside)
    self.view.addSubview(button_answer)
  end

  def show_questions
    controller = SfkQuestionsViewController.alloc.init
    self.navigationController.pushViewController(controller, animated: true)
  end

  def refresh_answers
    controller = SfkAnswersViewController.alloc.init
    self.navigationController.pushViewController(controller, animated: true)
  end

  def showAQuestion
    # @label.text = @sfkQuestion.randomQuestion
    # @label.alpha = 0

    UIView.animateWithDuration(1.0,
      animations: lambda {
        @labelSubject.alpha = 0
        @labelSubject.transform = CGAffineTransformMakeScale(0.1,0.1)
      },
      completion:lambda { |finished|
        @labelSubject.text = @sfkQuestion.randomQuestion
        UIView.animateWithDuration(1.0,
                        animations:lambda {
                          @labelSubject.alpha = 1
                          @labelSubject.transform = CGAffineTransformIdentity
                          })
        })
  end

  def makeLabel(x,y,width,height)
    label = UILabel.alloc.initWithFrame([[x,y],[width,height]])
    label.backgroundColor = UIColor.lightGrayColor
    label.text = ['Europa','Aufräumen','Berlin','Leberwurst'].sample
    label.font = UIFont.boldSystemFontOfSize(20)
    label.textColor = UIColor.darkGrayColor
    label.textAlignment = UITextAlignmentCenter
    label
  end

  def makeLabelIst(x,y,width,height)
    label = UILabel.alloc.initWithFrame([[x,y],[width,height]])
    label.backgroundColor = UIColor.lightGrayColor
    label.text = "Ist"
    label.font = UIFont.boldSystemFontOfSize(20)
    label.textColor = UIColor.darkGrayColor
    label.textAlignment = UITextAlignmentCenter
    label
  end

  def makeLabelQuestionMark(x,y,width,height)
    label = UILabel.alloc.initWithFrame([[x,y],[width,height]])
    label.backgroundColor = UIColor.lightGrayColor
    label.text = "?"
    label.font = UIFont.boldSystemFontOfSize(20)
    label.textColor = UIColor.darkGrayColor
    label.textAlignment = UITextAlignmentCenter
    label
  end

end
