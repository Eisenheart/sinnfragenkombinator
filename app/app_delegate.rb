class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'sinnfragenkombinator'
    rootViewController.view.backgroundColor = UIColor.whiteColor
    #UIPageViewController ?
    controllerQuestions = SfkQuestionsViewController.alloc.init

    navigationController = UINavigationController.alloc.initWithRootViewController(controllerQuestions)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    #create button
    @alt_questions_button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @alt_questions_button.setTitle("Alternative", forState:UIControlStateNormal)
    # @alt_questions_button.backgroundColor = UIColor.lightGreenColor
    @alt_questions_button.sizeToFit
    @alt_questions_button.frame = CGRect.new([10, @window.frame.size.height - 10 - @alt_questions_button.frame.size.height],
      @alt_questions_button.frame.size)

    @window.addSubview(@alt_questions_button)
    #animate button
    @alt_questions_button.addTarget(self, action:"select_new_question", forControlEvents:UIControlEventTouchUpInside)

    #create button
    @answers_button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @answers_button.setTitle("Zur Antwort", forState:UIControlStateNormal)
    @answers_button.sizeToFit
    # @answers_button.backgroundColor = UIColor.lightGreenColor #not working?
    @answers_button.frame = CGRect.new([@alt_questions_button.frame.origin.x + @alt_questions_button.frame.size.width + 180,@alt_questions_button.frame.origin.y],
    @answers_button.frame.size)

    @window.addSubview(@answers_button)

    #animate button
    @answers_button.addTarget(self, action:"go_to_answers",forControlEvents:UIControlEventTouchUpInside)

    true
   end

   #method for button animation
   def select_new_question
    new_view = UIView.alloc.initWithFrame(CGRect.new([0, 0], [100, 100]))
    new_view.backgroundColor = UIColor.blueColor
    last_view = @window.subviews[0]
    new_view.frame = CGRect.new(
        [last_view.frame.origin.x,last_view.frame.origin.y + last_view.frame.size.height + 10],
        last_view.frame.size)
    #needs to select a new question combination!

    @window.insertSubview(new_view, atIndex:0)
   end

    #method for button animation
    def go_to_answers
      other_views = @window.subviews.select do |view|
        not view.is_a? UIButton
      end
      @last_view = other_views.last
    end
end
