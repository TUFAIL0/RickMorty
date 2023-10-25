//
//  RMCharacterCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Tufail Ahmad on 23/10/23.
//

import UIKit
    //template of every single cell i. resue cell again again with diffrent data
    //single cell for character
class RMCharacterCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMCharactercollectionViewCell"
    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let namelabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 16 , weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubviews(imageView, namelabel , statusLabel)
        addConstraints()
        
    }
    
    required init?(coder : NSCoder){
        fatalError("Unsupported")
    }
    private func addConstraints(){
        NSLayoutConstraint.activate([
            statusLabel.heightAnchor.constraint(equalToConstant: 35),
            namelabel.heightAnchor.constraint(equalToConstant: 35),
            
            statusLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            statusLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            namelabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            namelabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            
            statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            namelabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: -3),
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: namelabel.topAnchor , constant: -3)
            
            
        ])
        imageView.backgroundColor = .systemGreen
        statusLabel.backgroundColor = .red
        namelabel.backgroundColor = .yellow
    }

    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        namelabel.text = nil
        statusLabel.text = nil
    }
    public func configure(with viewModel : RMCharacterCollectionViewCellViewModel){
        namelabel.text = viewModel.characterName
        statusLabel.text = viewModel.CharacterStatuText
        viewModel.FetchImage { [weak self]result in //bi direction pointer should not strong
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.imageView.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
        }
    }
}
