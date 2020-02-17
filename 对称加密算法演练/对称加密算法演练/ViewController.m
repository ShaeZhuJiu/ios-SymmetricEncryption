//
//  ViewController.m
//  对称加密算法演练
//
//  Created by 谢鑫 on 2020/2/13.
//  Copyright © 2020 Shae. All rights reserved.
//

#import "ViewController.h"
#import "EncryptionTools.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //AES - ECB 加密
    NSString *key=@"cc";
    //iv 向量
    NSString *result=[[EncryptionTools sharedEncryptionTools] encryptString:@"hello" keyString:key iv:nil];
    NSLog(@"base64d的result:%@",result);
    //解密
    NSString *decryptString=[[EncryptionTools sharedEncryptionTools] decryptString:@"Y/sCmKUMJsN9NUUahvxCqA==" keyString:key iv:nil];
    //如果密文和它的密钥不对应，解密结果会是null
    NSLog(@"decryptString:%@",decryptString);
    
    //AES - CBC 加密
    uint8_t iv[8]={1,2,3,4,5,6,7,8};
    NSData *ivData=[NSData dataWithBytes:iv length:sizeof(iv)];
    NSString *CBC_EncryptionString=[[EncryptionTools sharedEncryptionTools] encryptString:@"CCSmile" keyString:key iv:ivData];
    NSLog(@"CBC_EncryptionString:%@",CBC_EncryptionString);
    
    NSString *CBC_DecryptionString=[[EncryptionTools sharedEncryptionTools] decryptString:@"QoLihjsqqyc8jEozMvJdcQ==" keyString:key iv:ivData];
    NSLog(@"CBC_DecryptionString:%@",CBC_DecryptionString);
    
    //DES - ECB 加密
    [EncryptionTools sharedEncryptionTools].algorithm=kCCAlgorithmDES;
    NSString *ECB_CBC_EncryptionString=[[EncryptionTools sharedEncryptionTools] encryptString:@"hello" keyString:key iv:nil];
    NSLog(@"ECB_CBC_EncryptionString:%@",ECB_CBC_EncryptionString);
    //DES - ECB 解密
    NSString *ECB_CBC_DecryptionString=[[EncryptionTools sharedEncryptionTools] decryptString:@"21jEdt7zmTk=" keyString:key iv:nil];
    NSLog(@"ECB_CBC_DecryptionString:%@,%d",ECB_CBC_DecryptionString,[EncryptionTools sharedEncryptionTools].algorithm);
    
}


@end
