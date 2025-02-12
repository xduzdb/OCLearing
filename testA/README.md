# OCLearing
oc代码学习笔记
1. 进程/线程
    不管是使用pthread还是gcd，注意关注，当子线程在主线程中运行时，由于子线程未经过runloop保活，可能会出现主线程执行完毕，导致子线程自动结束，无法执行完子线程。
2. 操作耗时： 栈空间(NSString单字符串常量存放在常量区) < 堆空间 < I/O操作
3. pthread是c函数，oc向c函数传递参数，需要通过__bridge转化 -------eg: pthread_create(&pthread, NULL, demo, (__bridge void *)(name));
4. 多线程操作共享资源，为了避免读写不一致，通过@synchronized关键字来加锁。
    @synchronized: 任意对象都有一把默认开着的锁。
5. UIKit所有类几乎都是线程不安全的
   所有包涵Mutable的类

