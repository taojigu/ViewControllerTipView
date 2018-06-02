//
//  VTStatusView.m
//  Pods
//
//  Created by 顾吉涛 on 2018/5/3.
//

#import "VTStatusTipView.h"
#import "VTShowStatusStyle.h"
#import <Masonry.h>

@interface VTStatusTipView ()

@property (nonatomic) VTStatusTipModel *statusTipModel;
@property (nonatomic) UILabel *titleLabel;
@property (nonatomic) UILabel *messageLabel;
@property (nonatomic) UIButton *blockButton;
@property (nonatomic) UIImageView *imageView;
@property (nonatomic, assign) VTShowStatusStyle showStyle;

@end

@implementation VTStatusTipView

- (instancetype)initWithFrame:(CGRect)frame showStyle:(VTShowStatusStyle)showStyle {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self privateInit];
        //[self initConstraints:showStyle];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self privateInit];
    }
    return self;
}

- (void)privateInit {
    _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self addSubview:_imageView];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [self addSubview:_titleLabel];
    
    _blockButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [_blockButton addTarget:self action:@selector(blockButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [_blockButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_blockButton setBackgroundColor:[UIColor grayColor]];
    [self addSubview:_blockButton];
    
    UITapGestureRecognizer *tapRecog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTappedAction)];
    [self addGestureRecognizer:tapRecog];
    
    return;
}

- (void)confgureTipModel:(VTStatusTipModel *)model {
    self.statusTipModel = model;
    [self layoutCustomView:model.showStatusStyle];
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

- (void)viewTappedAction {
    self.statusTipModel.statusBlock();
}

#pragma mark -- layout

- (void)initConstraints:(VTShowStatusStyle)showStyle {
    if (VTShowStatusStyleDefault == showStyle) {
        [self initDefaultStyleConstraints];
        return;
    }
    if (VTShowStatusStyleButton == showStyle) {
        [self initButtonStyleConstraints];
        return;
    }
}

- (void)initDefaultStyleConstraints {

    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.width.height.equalTo(@(80));
        make.top.mas_equalTo(self).with.offset(60);
    }];
}

- (void)initButtonStyleConstraints {
    
}

- (void)layoutCustomView:(VTShowStatusStyle)showStyle {
    if (VTShowStatusStyleDefault == showStyle) {
        [self layoutWithStyleDefault];
        return;
    }
    if (VTShowStatusStyleButton == showStyle) {
        [self layoutWithStyleButton];
        return;
    }
}

- (void) layoutWithStyleDefault {
    [self.imageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.width.height.equalTo(@(80));
        make.top.mas_equalTo(self).with.offset(60);
    }];
}

- (void) layoutWithStyleButton {
    
}


@end
