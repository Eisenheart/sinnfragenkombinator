class SfkQuestionsViewController < UIViewController
  #there seem to be a bunch of standard view controller methods
  def loadView
    self.view = UIImageView.alloc.init
  end

  def viewDidLoad
    view.image = UIImage.imageNamed('epikouros.jpg') #needs to be compressed
    # view.image = CGRect(10,10,30,30); #images go in resources file
    labelFrame = CGRectMake(10, 60, 300, 80)
    @label = UILabel.alloc.initWithFrame(labelFrame)
    # @label = UILabel.alloc.initWithFrame([[10,60],[300,80]])
    view.addSubview(@label)

    end
end
