import UIKit
import AVKit

class IntroViewController: UIViewController {
    var imageView: UIImageView!
    var player: AVPlayer!

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    init() {
        self.imageView = UIImageView.init()
        self.imageView.image = UIImage.init(named: "marcel")
        self.imageView.contentMode = .center

        let url = Bundle.main.url(forResource: "intro", withExtension: "m4a")
        self.player = AVPlayer.init(url: url!)

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // status bar

    override var prefersStatusBarHidden: Bool {
        return true
    }

    // lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.init(
            red: 184.0 / 255.0,
            green: 250.0 / 255.0,
            blue: 235.0 / 255.0,
            alpha: 1.0
        )

        let tap = UITapGestureRecognizer.init()
        tap.addTarget(self, action: #selector(onTap))
        self.view.addGestureRecognizer(tap)

        self.view.addSubview(self.imageView)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.player.play()

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onAudioDidFinish),
            name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
            object: self.player.currentItem
        )
    }

    // listeners

    @objc
    func onTap() {
        self.player.pause()
        self.moveOn()
    }

    @objc
    func onAudioDidFinish() {
        self.moveOn()
    }

    // private

    func moveOn() {
        let vc = MainViewController.init()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
    }

    // layout

    override func viewWillLayoutSubviews() {
        self.imageView.frame = self.view.bounds
    }

}
