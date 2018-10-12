//
//  SetUpInfomationViewController.m
//  CommunityAPP
//
//  Created by 王帅宇 on 2018/10/9.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "SetUpInfomationViewController.h"
#import "PPNetworkHelper.h"
@interface SetUpInfomationViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *sexL;
@property (weak, nonatomic) IBOutlet UILabel *nickNameL;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageV;

@end

@implementation SetUpInfomationViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"nav_cacel"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)backButtonClick {
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    self.tableView.tableFooterView = [[UIView alloc]init];
    // 赋值
    [self setValue];
   
}

- (void)setValue {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *sex =  [defaults objectForKey:@"sex"];
    self.sexL.text = sex?:@"";
    self.nickNameL.text = [HHComlient sharedInstance].user.nickname?:@"";
    [self.iconImageV sd_setImageWithURL:[NSURL URLWithString:[HHComlient sharedInstance].user.face] placeholderImage:nil];
    
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 && indexPath.row == 0) {// 头像
        
        UIAlertController *al = [UIAlertController alertControllerWithTitle:@"请选择" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *camera = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                
                [self getPhotoWithSourceType:UIImagePickerControllerSourceTypeCamera];
            }
        }];
        UIAlertAction *photos = [UIAlertAction actionWithTitle:@"本地相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
                
                [self getPhotoWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
            }
        }];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [al addAction:camera];
        [al addAction:photos];
        [al addAction:cancel];
        [self presentViewController:al animated:YES completion:nil];
        
    }else if (indexPath.row == 1){// 会员昵称
        
    }else if (indexPath.row == 2){// 性别
        UIAlertController *al = [UIAlertController alertControllerWithTitle:@"请选择" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *camera = [UIAlertAction actionWithTitle:@"男" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.sexL.text = @"男";
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:@"男" forKey:@"sex"];
            [defaults synchronize];
        }];
        UIAlertAction *photos = [UIAlertAction actionWithTitle:@"女" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.sexL.text = @"女";
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:@"女" forKey:@"sex"];
            [defaults synchronize];
        }];
        [al addAction:camera];
        [al addAction:photos];
        [self presentViewController:al animated:YES completion:nil];

    }else if (indexPath.row == 3){// 标签分类
        
    }
    
}

#pragma mark  ---  跳转相机
- (void)getPhotoWithSourceType:(UIImagePickerControllerSourceType)sourceType {
    // 跳转到相机或相册页面
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = YES;
    imagePickerController.sourceType = sourceType;
    [self presentViewController:imagePickerController animated:YES completion:^{                }];
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [picker dismissViewControllerAnimated:YES completion:^{        }];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    // 拿到图片上传头像
    [PPNetworkHelper uploadImagesWithURL:[NSString stringWithFormat:@"%@%@",URI_MAIN,inter_avater] parameters:nil name:@"upload" images:@[image] fileNames:@[image] imageScale:0.1 imageType:@"png" progress:^(NSProgress *progress) {
    } success:^(id responseObject) {
        if (responseObject) {
            
            NSString * imagePath = responseObject[@"data"][@"img_url"];
            HHLog(@"上传成功 === %@",imagePath);
            [self.iconImageV sd_setImageWithURL:[NSURL URLWithString:imagePath] placeholderImage:nil];
            [HHComlient sharedInstance].user.face = imagePath;
//            [self.picPathArray addObject:imagePath];
//            NSString *string = [self.picPathArray componentsJoinedByString:@","];
//            [self.dataSourceDictionary setValue:string forKey:@"photos"];
        }
    } failure:^(NSError *error) {
        HHLog(@"error==%@",error);
    }];
    
}


//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
