### Quick Look

This library was created for general usage when keyframe animations used and key values can't be easily interpolated thru animation progress.

# easeqs

[![GitHub release](https://img.shields.io/github/release/nikburnt/easeqs-objc.svg)]() [![CocoaPods](https://img.shields.io/cocoapods/easeqs-objc.svg)]() [![GitHub issues](https://img.shields.io/github/issues/nikburnt/easeqs-objc.svg)]() [![Build Status](https://travis-ci.org/nikburnt/easeqs-objc.svg?branch=master)](https://travis-ci.org/nikburnt/easeqs-objc)

## Availabble Easing Functions
------------
Here is the list of available easing functions:

| | In | Out | InOut | OutIn |
| ------------: | :------------: | :------------: | :------------: | :------------: |
| Linear | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/linear.png?raw=true) | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/linear.png?raw=true) |![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/linear.png?raw=true) | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/linear.png?raw=true) |
| Sinusoidal | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/sin-in.png?raw=true) | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/sin-out.png?raw=true) | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/sin-inout.png?raw=true) | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/sin-outin.png?raw=true) |
| Quadratic | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/quad-in.png?raw=true) | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/quad-out.png?raw=true) | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/quad-inout.png?raw=true) | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/quad-outin.png?raw=true) |
| Cubic | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/cubic-in.png?raw=true) | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/cubic-out.png?raw=true) | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/cubic-inout.png?raw=true) | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/cubic-outin.png?raw=true) |
| Quartic | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/quart-in.png?raw=true) | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/quart-out.png?raw=true) | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/quart-inout.png?raw=true) | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/quart-outin.png?raw=true) |
| Quintic | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/quint-in.png?raw=true) | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/quint-out.png?raw=true) | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/quint-inout.png?raw=true) | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/quint-outin.png?raw=true) |
| Exponential | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/expo-in.png?raw=true) | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/expo-out.png?raw=true) | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/expo-inout.png?raw=true) | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/expo-outin.png?raw=true) |
| Circular | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/circ-in.png?raw=true) | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/circ-out.png?raw=true) | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/circ-inout.png?raw=true) | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/circ-outin.png?raw=true) |
| <abbr title="This easing function may be configured with overshoot value">Back</abbr> | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/back-in.png?raw=true) | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/back-out.png?raw=true) | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/back-inout.png?raw=true) | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/back-outin.png?raw=true) |
| <abbr title="This easing function may be configured with overshoot value">Bounce</abbr> | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/bounce-in.png?raw=true) | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/bounce-out.png?raw=true) | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/bounce-inout.png?raw=true) | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/bounce-outin.png?raw=true) |
| <abbr title="This easing function may be configured with amplitude and period value">Elastic</abbr> | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/elastic-in.png?raw=true) | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/elastic-out.png?raw=true) | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/elastic-inout.png?raw=true) | ![](https://github.com/nikburnt/easeqs-objc/blob/master/Screenshots/elastic-outin.png?raw=true) |

## Usage

This library can be used in two ways: OOP and functional. 
In the first case easing function represents one of the next objects instance(they all are childs of `ESQEasingFunction`):
- `ESQLinearEasingFunction`
- `ESQSinusoidalEasingFunction`
- `ESQQuadraticEasingFunction`
- `ESQCubicEasingFunction`
- `ESQQuarticEasingFunction`
- `ESQQuinticEasingFunction`
- `ESQExponentialEasingFunction`
- `ESQCircularEasingFunction`
- `ESQBackEasingFunction`
- `ESQBounceEasingFunction`
- `ESQElasticEasingFunction`

Those object can be instantiated in the few ways:
1. Without any parameters, default values will be used for type(`ESQEasingFunctionTypeOut`) and parameters
```objective-c
CGFloat progress = ...
ESQEasingFunction *easingFunction = [[ESQElasticEasingFunction alloc] init];
CGFloat easedProgress = [easingFunction easedProgress:progress];
```
2. With specified type(if functiona also have a parameters default values will be used)
```objective-c
CGFloat progress = ...
ESQEasingFunction *easingFunction = [ESQElasticEasingFunction easingFunctionWithType:ESQEasingFunctionTypeInOut];
CGFloat easedProgress = [easingFunction easedProgress:progress];
```
3. With specified type and parameters:
```objective-c
CGFloat customAmplitude = ...
CGFloat progress = ...
ESQEasingFunction *easingFunction = [ESQElasticEasingFunction easingFunctionWithType:ESQEasingFunctionTypeInOut amplitude:customAmplitude  period:ESQDefaultElasticPeriod];
CGFloat easedProgress = [easingFunction easedProgress:progress];
```

Also, if you preffer funcitons or need more <abbr title="Functions are ~8x faster than using objects!">perfomance</abbr> you may use easing functions which can provide the same results as using objects. Here is the list of all available easing funcitons:

| | In | Out | InOut | OutIn |
| ------------: | :------------: | :------------: | :------------: | :------------: |
| Linear | `linearIn(p)` | `linearOut(p)` | `linearInOut(p)` | `linearOutIn(p)` |
| Sinusoidal | `sinusoidalIn(p)` | `sinusoidalOut(p)` | `sinusoidalInOut(p)` | `sinusoidalOutIn(p)` |
| Quadratic | `CGFloat quadraticIn(p)` | `CGFloat quadraticOut(p)` | `CGFloat quadraticInOut(p)` | `CGFloat quadraticOutIn(p)` |
| Cubic | `cubicIn(p)` | `cubicOut(p)` | `cubicInOut(p)` | `cubicOutIn(p)` |
| Quartic | `quarticIn(p)` | `quarticOut(p)` | `quarticInOut(p)` | `quarticOutIn(p)` |
| Quintic | `quinticIn(p)` | `quinticOut(p)` | `quinticInOut(p)` | `quinticOutIn(p)` |
| Exponential | `exponentialIn(p)` | `exponentialOut(p)` | `exponentialInOut(p)` | `exponentialOutIn(p)` |
| Circular | `circularIn(p)` | `circularOut(p)` | `circularInOut(p)` | `circularOutIn(p)` |
| <abbr title="This easing function may be configured with overshoot value">Back</abbr> | `backIn(p, o)` | `backOut(p, o)` | `backInOut(p, o)` | `backOutIn(p, o)` |
| <abbr title="This easing function may be configured with overshoot value">Bounce</abbr> | `bounceIn(p, o)` | `bounceOut(p, o)` | `bounceInOut(p, o)` | `bounceOutIn(p, o)` |
| <abbr title="This easing function may be configured with amplitude and period value">Elastic</abbr> | `elasticIn(p, a, q)` | `elasticOut(p, a, q)` | `elasticInOut(p, a, q)` | `elasticOutIn(p, a, q)` |

Every function should obtain progress as input and a few parameters(if needed).
```objective-c
CGFloat customAmplitude = ...
CGFloat progress = ...
CGFloat easedProgress = elasticInOut(progress, customAmplitude, ESQDefaultElasticPeriod);
```

Pleae, take a note, that default values for functions provided available in each header where this funciton described.

## Installing
------------
easeqs-objc is available through <a href="http://cocoapods.org/?q=eqseqs">CocoaPods</a> or may be easily build from source.

### Static Library

```ruby
# platform *must* be at least 5.0
platform :ios, '5.0'

target :MyAppTarget, :exclusive => true do

pod 'easeqs-objc'

end
```

### Dynamic Framework

If you're using Swift, you may wish to install dynamic frameworks, which can be done with the Podfile shown below: 

```ruby
# platform *must* be at least 8.0
platform :ios, '8.0'

use_frameworks!

pod 'easeqs-objc'
```

## Roadmap
------------
- Add 4 dimensions structures keyframe animaiton support(CGRect)
- Add <a href="https://github.com/Carthage/Carthage">Carthage</a> support
- Think about better way to describe multiple easing funcitons for the animaiton of complex structures(2 or more dimensional)
- Create Swift version

