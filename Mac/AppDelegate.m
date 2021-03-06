/*
 Copyright (c) 2014, Pierre-Olivier Latour
 All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright
 notice, this list of conditions and the following disclaimer in the
 documentation and/or other materials provided with the distribution.
 * The name of Pierre-Olivier Latour may not be used to endorse
 or promote products derived from this software without specific
 prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL PIERRE-OLIVIER LATOUR BE LIABLE FOR ANY
 DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "AppDelegate.h"
#import "XLFacilityMacros.h"
#import "XLAppKitOverlayLogger.h"
#import "XLTelnetServerLogger.h"

@implementation AppDelegate

- (IBAction)testLog:(id)sender {
  XLOG_INFO(@"%s", __FUNCTION__);
}

- (IBAction)testAbort:(id)sender {
  XLOG_ABORT(@"%s", __FUNCTION__);
}

- (void)applicationDidFinishLaunching:(NSNotification*)notification {
  [XLSharedFacility addLogger:[[XLTelnetServerLogger alloc] init]];
  [XLSharedFacility addLogger:[XLAppKitOverlayLogger sharedLogger]];
  XLOG_VERBOSE(@"XLFacility servers running on %@", GCDTCPServerGetPrimaryIPAddress(false));

  XLOG_INFO(@"%s", __FUNCTION__);
}

- (void)applicationDidBecomeActive:(NSNotification*)notification {
  XLOG_INFO(@"%s", __FUNCTION__);
}

- (void)applicationDidResignActive:(NSNotification*)notification {
  XLOG_INFO(@"%s", __FUNCTION__);
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication*)sender {
  return YES;
}

@end
