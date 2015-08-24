class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'sinnfragenkombinator'
    rootViewController.view.backgroundColor = UIColor.whiteColor

    controllerQuestions = SfkQuestionsViewController.alloc.init

    navigationController = UINavigationController.alloc.initWithRootViewController(controllerQuestions)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible


    true
  end
end
