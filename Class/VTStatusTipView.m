//
//  VTStatusView.m
//  Pods
//
//  Created by 顾吉涛 on 2018/5/3.
//

#import "VTStatusTipView.h"

@interface VTStatusTipView ()

@property (nonatomic) VTStatusTipModel *statusTipModel;
@property (nonatomic) UILabel *titleLabel;
@property (nonatomic) UILabel *messageLabel;
@property (nonatomic) UIButton *blockButton;
@property (nonatomic) UIImageView *imageView;

@end

@implementation VTStatusTipView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self privateInit];
    }
    return self;
}

- (void)privateInit {
    _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _blockButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [_blockButton addTarget:self action:@selector(blockButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [_blockButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_blockButton setBackgroundColor:[UIColor grayColor]];
    return;
}

- (void)confgureTipModel:(VTStatusTipModel *)model {
    self.statusTipModel = model;
    [self refreshStatusTipView];
}

- (void)refreshStatusTipView {
    self.imageView.image = self.statusTipModel.statusImage;
    [self.blockButton setTitle:self.statusTipModel.buttonText forState:UIControlStateNormal];
    self.titleLabel.text = self.statusTipModel.title;
    self.messageLabel.text = self.statusTipModel.message;
    [self setNeedsLayout];
}

- (void)blockButtonClicked {
    self.statusTipModel.statusBlock();
}

@end
