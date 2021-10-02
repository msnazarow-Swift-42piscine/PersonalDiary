//
//  ArticleViewController.swift
//  PersonalDiary
//
//  Created by out-nazarov2-ms on 02.10.2021.
//  
//

import UIKit
import UITextView_Placeholder

class ArticleViewController: UIViewController {
    let gap: CGFloat = 10

    let titleTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 20 * verticalTranslation)
        textField.borderStyle = .roundedRect
        textField.placeholder = "Input your title here ... "
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let contentTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 17 * verticalTranslation)
        textView.layer.borderWidth = 1
        textView.placeholder = "Input your content here ... "
        textView.layer.cornerRadius = 10 * verticalTranslation
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var vstack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleTextField, contentTextView, hstack, imageView])
        stack.spacing = gap
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    let cameraButton: UIButton = {
        let button = UIButton()
        button.setTitle("Take Picture", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonDidTapped(_:)), for: .touchUpInside)
        return button
    }()

    let galeryButton: UIButton = {
        let button = UIButton()
        button.setTitle("Choose Picture", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonDidTapped(_:)), for: .touchUpInside)
        return button
    }()

    lazy var hstack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [cameraButton, galeryButton])
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    let imagePicker: UIImagePickerController = {
        let picker = UIImagePickerController()
        return picker
    }()

    // MARK: - Properties
    var presenter: ViewToPresenterArticleProtocol!

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }

    private func setupUI() {
        addSubviews()
        setupConstraints()
        view.backgroundColor = .white
        title = "Article"
        imagePicker.delegate = self
    }

    private func addSubviews() {
        view.addSubview(vstack)
        navigationItem.leftBarButtonItem = .init(title: "Cancel", style: .plain, target: self, action: #selector(barButtonDidTapped))
        navigationItem.rightBarButtonItem = .init(title: "Save", style: .plain, target: self, action: #selector(barButtonDidTapped))
    }

    @objc func buttonDidTapped(_ sender: UIButton) {
        guard let title = sender.title(for: .normal) else { return }
        presenter.buttonDidTapped(title: title)
    }

    @objc func barButtonDidTapped(_ sender: UIBarButtonItem) {
        guard let title = sender.title else { return }
        presenter.buttonDidTapped(title: title)
    }

    func openCamera() {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }

    func openGalery() {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleTextField.heightAnchor.constraint(equalToConstant: 50 * verticalTranslation),
            imageView.heightAnchor.constraint(equalToConstant: 300 * verticalTranslation),
            vstack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: gap),
            vstack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -gap),
            vstack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: gap),
            vstack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -gap)
        ])
    }
}

extension ArticleViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectImage =
            info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imageView.image = selectImage
            dismiss(animated: true, completion: nil)
        }
    }
}

extension ArticleViewController: PresenterToViewArticleProtocol{
    func setArticleTitle(title: String) {
        DispatchQueue.main.async {
            self.titleTextField.text = title
        }
    }

    func getArticleTitle() -> String? {
        titleTextField.text
    }

    func setArticleContent(content: String) {
        DispatchQueue.main.async {
            self.contentTextView.text = content
        }
    }

    func getArticleContent() -> String? {
        contentTextView.text
    }

    func setArticleImage(data: Data) {
        DispatchQueue.main.async {
            self.imageView.image = UIImage(data: data)
        }
    }

    func getArticleImage() -> Data? {
        imageView.image?.jpegData(compressionQuality: 1)
    }
}
