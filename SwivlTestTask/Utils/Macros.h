//
//  Macros.h
//  SwivlTestTask
//
//  Created by Petro Korienev on 6/29/15.
//  Copyright (c) 2015 Petro Korienev. All rights reserved.
//

#import <Masonry/Masonry.h>

#define EMBED_VIEW_INTO_VIEW_WITH_EDGE_INSETS(view, superview, inset) \
[(view) mas_makeConstraints:^(MASConstraintMaker *make) \
{ \
    make.edges.equalTo((superview)).with.insets((inset)); \
}];