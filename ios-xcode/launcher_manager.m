//
//  launcher_manager.c
//  INSTEAD
//
//  Created by Виктор on 09.03.15.
//
//

#include "launcher_manager.h"
#import <UIKit/UIKit.h>


void showLauncher()
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:[NSBundle mainBundle]];
    UINavigationController *nav = [storyboard instantiateInitialViewController];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:nav animated:YES completion:^{}];
}
