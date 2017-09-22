//
//  NBTDefines.h
//  easeqs-objc-example
//
//  Created by Nik Burnt on 13.09.17.
//  Copyright © 2017 Nik Burnt. All rights reserved.
//

#ifndef NBTDefines_h
#define NBTDefines_h

@import Foundation;

NS_INLINE void nbt_dispatch_after_on_main(NSTimeInterval waitFor, dispatch_block_t block) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(waitFor * NSEC_PER_SEC)),
                   dispatch_get_main_queue(),
                   block);
}

#endif /* NBTDefines_h */
