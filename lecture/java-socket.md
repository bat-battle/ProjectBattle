
## java 网络编程基础

### 问题

1. java 的 socket 与 c 的 socket 的关系? ServerSocket, Socket
2. 例子
3. 网络编程



1. 如何检验一个端口?
2. 如何对地址进行校验, String, int 与 byte[] 互相转换? Inet4Address
4. 如果校验入口参数, 返回值或异常?
5. 如何判断一个地址是私有地址? Inet4Address 的 isSiteLocalAddress

### Socket

### 通道

public abstract class AsynchronousChannelGroup
class Channels

interface Channel
interface NetworkChannel extends Channel
interface AsynchronousByteChannel extends AsynchronousChannel
abstract class AsynchronousServerSocketChannel implements AsynchronousChannel, NetworkChannel
abstract class AsynchronousSocketChannel implements AsynchronousByteChannel, NetworkChannel
abstract class AsynchronousFileChannel implements AsynchronousChannel
interface AsynchronousByteChannel extends AsynchronousChannel
abstract class AbstractInterruptibleChannel implements Channel, InterruptibleChannel

abstract class SelectableChannel extends AbstractInterruptibleChannel implements Channel
abstract class AbstractSelectableChannel extends SelectableChannel
abstract class ServerSocketChannel extends AbstractSelectableChannel implements NetworkChannel
abstract class AbstractSelectableChannel extends SelectableChannel

abstract class SocketChannel extends AbstractSelectableChannel implements ByteChannel, ScatteringByteChannel, GatheringByteChannel, NetworkChannel

abstract class FileChannel extends AbstractInterruptibleChannel implements SeekableByteChannel, GatheringByteChannel, ScatteringByteChannel

abstract class DatagramChannel extends AbstractSelectableChannel implements ByteChannel, ScatteringByteChannel, GatheringByteChannel, MulticastChannel


abstract class Selector
abstract class AbstractSelector extends Selector
abstract class AsynchronousChannelProvider
abstract class SelectorProvider

abstract class SelectionKey
abstract class AbstractSelectionKey extends SelectionKey


### 读写

interface ReadableByteChannel extends Channel
interface ScatteringByteChannel extends ReadableByteChannel
interface SeekableByteChannel extends ByteChannel

interface WritableByteChannel extends Channel

interface ByteChannel extends ReadableByteChannel, WritableByteChannel

### 其他

abstract class Pipe
class DatagramSocket
public interface SocketOptions


interface SocksConsts

### TCP

abstract class SocketImpl implements SocketOptions
abstract class AbstractPlainSocketImpl extends SocketImpl
class PlainSocketImpl extends AbstractPlainSocketImpl
class SocksSocketImpl extends PlainSocketImpl implements SocksConsts

### UDP

interface DatagramSocketImplFactory
public abstract class DatagramSocketImpl implements SocketOptions
abstract class AbstractPlainDatagramSocketImpl extends DatagramSocketImpl
class PlainDatagramSocketImpl extends AbstractPlainDatagramSocketImpl

class ServerSocket
class Socket

public interface SocketOption<T>
interface SocketImplFactory


class StandardSocketOptions

class DatagramPacket

### 地址

interface InetAddressImpl
class Inet4AddressImpl implements InetAddressImpl
class Inet6AddressImpl implements InetAddressImpl

class InetAddress 组合 InetAddressImpl
class Inet4Address extends InetAddress
class Inet6Address extends InetAddress

abstract class SocketAddress (组合 InetAddress)
class InetSocketAddress extends SocketAddress

class NetworkInterface

class PlainDatagramSocketImpl extends AbstractPlainDatagramSocketImpl
class PlainSocketImpl extends AbstractPlainSocketImpl
