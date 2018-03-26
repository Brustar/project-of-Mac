//
//  SizeAdaptationUtils.m
//  Vmei
//
//  Created by DT on 15/8/1.
//  Copyright (c) 2015年 com.vmei. All rights reserved.
//

#import "SizeAdaptationUtils.h"

CGFloat adjustsSizeToFitWidth375(CGFloat size)
{
    if (systemDeviceIsPad()) {
        return size * 1.2;
    }else{
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        return size*width/375;
    }
}

CGFloat adjustsSizeToFitWidth750(CGFloat size)
{
    return adjustsSizeToFitWidth375(size/2);
}

UIFont* adjustsSizeToFitFont(CGFloat pix)
{
    if (systemDeviceIsPad()) {
        return [UIFont systemFontOfSize:pix + 1.2];
    }else {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat sizeScale = 1.0;
        if (width == 320) {
            sizeScale -= 0.17;
        }else if (width == 414) {
            sizeScale += 0.19;
        }
        return [UIFont systemFontOfSize:pix + sizeScale];
    }
}

UIFont* adjustsSizeToFitBoldFont(CGFloat pix)
{
    if (systemDeviceIsPad()) {
        return [UIFont systemFontOfSize:pix + 1.2];
    }else {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat sizeScale = 1.0;
        if (width == 320) {
            sizeScale -= 0.17;
        }else if (width == 414) {
            sizeScale += 0.19;
        }
        return [UIFont boldSystemFontOfSize:pix + sizeScale];
    }
    
}
