
## IO

1. Reader Writer : 字符流(character streams)
2. InputStream, OutputStream : 字节流(byte streams)
3. InputStreamReader, OutputStreamWriter : a bridge from character streams to byte streams
4. DataOutput, DataInput: reading(writing) bytes from a binary stream and reconstructing from them data in any of the Java primitive types

通常来说,字节流的功能比字符流的功能强大,因为计算机里所有的数据都是二进制的,
因此字节流可以处理所有所有的二进制文件.

Java 的 I/O 功能通过 java.io 包下的类和接口来支持, 在 java.io 包下主要包括
输入/输出两种 IO 流, 每种输入/输出流又可分为字节流和字符流两大类. 字节流
支持以字节(8位)为单位的 IO 操作,而字符流则以字符(16位-Java中)为单位进行
IO操作.

Java 的 IO 流还使用装饰者模式, 将 IO 流分成底层节点流和上层处理流, 节点流
直接和底层的物理存储节点关联, 虽然不同的物理节点获取的节点流可能存在差异,
但程序可以把不同的物理节点包装成统一的处理流, 从而允许程序使用统一的 IO
代码来操作不同的物理节点.

如果使用字节流来处理文本文件,则需要将这些字节转换成字符,增加了编程的复杂度.
所以有一个规则:如果进行IO是文本内容,则应该考虑使用字符流;如果进行IO的是二进制
内容, 则应该考虑使用字节流.

interface Serializable
interface Externalizable extends Serializable
//interface FilenameFilter

interface DataOutput
interface ObjectOutput extends DataOutput, AutoCloseable

interface DataInput
interface ObjectInput extends DataInput, AutoCloseable

interface FileFilter
interface Flushable
interface ObjectStreamConstants
interface ObjectInputValidation

class File extends Object implements Serializable, Comparable<File>

abstract static class ObjectInputStream.GetField extends Object

class RandomAccessFile extends Object implements DataOutput, DataInput, Closeable

RandomAccessFile 不能直接向文件的指定位置插入数据, 不然新插入的数据会覆盖文件的
原内容.如果需要向指定的位置插入数据,程序需要先把指定插入点后的内容读入缓冲区,
等把需要插入的数据写入完成后, 再将缓冲区的内容追加到文件后面.

abstract class Reader extends Object implements Readable, Closeable
class InputStreamReader extends Reader : a bridge from character streams to byte streams
class FileReader extends InputStreamReader
class BufferedReader extends Reader : 缓冲机制

class LineNumberReader extends BufferedReader
class CharArrayReader extends Reader
class PipedReader extends Reader
class StringReader extends Reader


abstract class FilterReader extends Reader
class PushbackReader extends FilterReader

abstract class Writer extends Object implements Appendable, Closeable, Flushable
class OutputStreamWriter extends Writer : a bridge from character streams to byte streams
class FileWriter extends OutputStreamWriter
class BufferedWriter extends Writer : 缓冲机制


class CharArrayWriter extends Writer
abstract class FilterWriter extends Writer
class PipedWriter extends Writer
class StringWriter extends Writer


interface Closeable extends AutoCloseable
abstract class InputStream extends Object implements Closeable
class FileInputStream extends InputStream : raw bytes such as image data
class ByteArrayInputStream extends InputStream :
class FilterInputStream extends InputStream
class PipedInputStream extends InputStream
class SequenceInputStream extends InputStream : logical concatenation of other input streams
class StringBufferInputStream extends InputStream : @Deprecated
class ObjectInputStream extends InputStream implements ObjectInput, ObjectStreamConstants


class BufferedInputStream extends FilterInputStream : buffer the input and to support the mark and reset methods
class LineNumberInputStream extends FilterInputStream : @Deprecated
class PushbackInputStream extends FilterInputStream : 后续

abstract class OutputStream extends Object implements Closeable, Flushable
class FileOutputStream extends OutputStream : raw bytes such as image data
class BufferedOutputStream extends FilterOutputStream
class ObjectOutputStream extends OutputStream implements ObjectOutput, ObjectStreamConstants

class PipedOutputStream extends OutputStream
abstract static class ObjectOutputStream.PutField extends Object
class ByteArrayOutputStream extends OutputStream : writeTo
class FilterOutputStream extends OutputStream


final class FileDescriptor extends Object
final class FilePermission extends Permission implements Serializable
class ObjectStreamClass extends Object implements Serializable
class ObjectStreamField extends Object implements Comparable<Object>

final class SerializablePermission extends BasicPermission
class StreamTokenizer extends Object
final class Console extends Object implements Flushable

## NIO

* NIO是基于块（Block）的，它以块为基本单位处理数据 （硬盘上存储的单位也是按Block来存储，这样性能上比基于流的方式要好一些）
* 为所有的原始类型提供（Buffer）缓存支持 
* 增加通道（Channel）对象，作为新的原始 I/O 抽象
* 支持锁（我们在平时使用时经常能看到会出现一些.lock的文件，这说明有线程正在使用这把锁，当线程释放锁时，会把这个文件删除掉，这样其他线程才能继续拿到这把锁）和内存映射文件的文件访问接口 
* 提供了基于Selector的异步网络I/O 

Buffer : a linear, finite sequence of elements of a specific primitive type
Channel : A nexus for I/O operations

standard IO is based on streams and NIO is buffer oriented
Buffer oriented operations provide as flexibility in handling data.
In buffer oriented NIO, data is first read into a buffer and then
it is made available for processing. So we can move back and forth
in the buffer. But in the case of streams it is not possible.

In case of streams, a thread will be blocked until it completes the IO operation.
Wherein the NIO allows for non-blocking operations.

### java.nio

abstract class Buffer extends Object
final class ByteOrder extends Object
abstract class ByteBuffer extends Buffer implements Comparable<ByteBuffer>

abstract class MappedByteBuffer extends ByteBuffer
abstract class CharBuffer extends Buffer implements Comparable<CharBuffer>, Appendable, CharSequence, Readable
abstract class DoubleBuffer extends Buffer implements Comparable<DoubleBuffer>
abstract class FloatBuffer extends Buffer implements Comparable<FloatBuffer>
abstract class IntBuffer extends Buffer implements Comparable<IntBuffer>
abstract class LongBuffer extends Buffer implements Comparable<LongBuffer>
abstract class ShortBuffer extends Buffer implements Comparable<ShortBuffer>

### java.nio.channels

interface Channel extends Closeable
interface AsynchronousChannel extends Channel
interface AsynchronousByteChannel extends AsynchronousChannel
interface ReadableByteChannel extends Channel
interface WritableByteChannel extends Channel
interface ByteChannel extends ReadableByteChannel, WritableByteChannel

interface CompletionHandler<V,A>
interface GatheringByteChannel extends WritableByteChannel
interface ScatteringByteChannel extends ReadableByteChannel
interface InterruptibleChannel extends Channel
interface NetworkChannel extends Channel
interface MulticastChannel extends NetworkChannel
interface SeekableByteChannel extends ByteChannel

final class Channels extends Object

abstract class FileChannel extends AbstractInterruptibleChannel implements SeekableByteChannel, GatheringByteChannel, ScatteringByteChannel
static class FileChannel.MapMode extends Object
abstract class AsynchronousFileChannel extends Object implements AsynchronousChannel
abstract class FileLock extends Object implements AutoCloseable

---------------------------------------------------

abstract class Pipe extends Object
abstract static class Pipe.SinkChannel extends AbstractSelectableChannel implements WritableByteChannel, GatheringByteChannel
abstract static class Pipe.SourceChannel extends AbstractSelectableChannel implements ReadableByteChannel, ScatteringByteChannel


abstract class MembershipKey extends Object : 没有用
abstract class AsynchronousChannelGroup extends Object
abstract class AsynchronousServerSocketChannel extends Object implements AsynchronousChannel, NetworkChannel
abstract class AsynchronousSocketChannel extends Object implements AsynchronousByteChannel, NetworkChannel
abstract class SelectableChannel extends AbstractInterruptibleChannel implements Channel
abstract class SelectionKey extends Object
abstract class Selector extends Object implements Closeable
abstract class ServerSocketChannel extends AbstractSelectableChannel implements NetworkChannel
abstract class SocketChannel extends AbstractSelectableChannel implements ByteChannel, ScatteringByteChannel, GatheringByteChannel, NetworkChannel
abstract class DatagramChannel extends AbstractSelectableChannel implements ByteChannel, ScatteringByteChannel, GatheringByteChannel, MulticastChannel

### java.nio.spi

abstract class AbstractInterruptibleChannel extends Object implements Channel, InterruptibleChannel
abstract class AbstractSelectableChannel extends SelectableChannel
abstract class AbstractSelectionKey extends SelectionKey
abstract class AbstractSelector extends Selector
abstract class AsynchronousChannelProvider extends Object
abstract class SelectorProvider extends Object


### java.nio.charset

abstract class Charset extends Object implements Comparable<Charset>
abstract class CharsetDecoder extends Object
abstract class CharsetEncoder extends Object
class CoderResult extends Object
class CodingErrorAction extends Object
final class StandardCharsets extends Object

### java.nio.charset.spi

abstract class CharsetProvider extends Object


### java.nio.file

interface CopyOption
interface DirectoryStream<T> extends Closeable, Iterable<T>
static interface DirectoryStream.Filter<T>
interface FileVisitor<T>
interface OpenOption
interface Path extends Comparable<Path>, Iterable<Path>, Watchable
interface PathMatcher
interface SecureDirectoryStream<T> extends DirectoryStream<T>

interface WatchService extends Closeable
interface Watchable
interface WatchEvent<T>
static interface WatchEvent.Kind<T>
static interface WatchEvent.Modifier
interface WatchKey

final class Files extends Object
abstract class FileStore extends Object
abstract class FileSystem extends Object implements Closeable
final class FileSystems extends Object
final class LinkPermission extends BasicPermission
final class Paths extends Object
class SimpleFileVisitor<T> extends Object implements FileVisitor<T>
final class StandardWatchEventKinds extends Object

enum AccessMode extends Enum<AccessMode>
enum FileVisitOption extends Enum<FileVisitOption>
enum FileVisitResult extends Enum<FileVisitResult>
enum LinkOption extends Enum<LinkOption> implements OpenOption, CopyOption
enum StandardCopyOption extends Enum<StandardCopyOption> implements CopyOption
enum StandardOpenOption extends Enum<StandardOpenOption> implements OpenOption

### java.nio.file.attribute

interface AclFileAttributeView extends FileOwnerAttributeView
interface AttributeView
interface BasicFileAttributes
interface BasicFileAttributeView extends FileAttributeView

interface DosFileAttributes extends BasicFileAttributes
interface DosFileAttributeView extends BasicFileAttributeView
interface FileAttribute<T>
interface FileAttributeView extends AttributeView
interface FileOwnerAttributeView extends FileAttributeView
interface FileStoreAttributeView extends AttributeView

interface PosixFileAttributes extends BasicFileAttributes
interface PosixFileAttributeView extends BasicFileAttributeView, FileOwnerAttributeView

interface UserDefinedFileAttributeView extends FileAttributeView
interface UserPrincipal extends Principal
interface GroupPrincipal extends UserPrincipal

final class AclEntry extends Object
static final class AclEntry.Builder extends Object
final class FileTime extends Object implements Comparable<FileTime>
final class PosixFilePermissions extends Object
abstract class UserPrincipalLookupService extends Object

enum AclEntryFlag extends Enum<AclEntryFlag>
enum AclEntryPermission extends Enum<AclEntryPermission>
enum AclEntryType extends Enum<AclEntryType>
enum PosixFilePermission extends Enum<PosixFilePermission>

### java.nio.file.spi

abstract class FileSystemProvider extends Object
abstract class FileTypeDetector extends Object


##举例

netty
guava


## 附录

### ByteBuffer

* Capacity：开的内存的大小，一旦设定了，就不能更改了。注意，这里指的是原生的NIO。
* Limit：可以分读写来统计。在写入buffer时，limit表示有多少空间可以写入。在从buffer写出时，limit表示有多少可以写出。
* Position：下一个要被读或写的位置。
* Mark：标记位，可以记住某个position，方便后续操作。

* flip():：postion = 0, limit = position, 读写模式的转换。
* rewind() ：position = 0, mark = -1;  一般用于重复读。
* clear() ： position = 0; limit = capacity; "清空" buffer ，准备再次被写入
* compact(): 将未读取的数据拷贝到 buffer 的头部位。
* mark() 、 reset():mark 可以标记一个位置， reset 可以重置到该位置。



### Selector 的实现

selector 是一个选择器，它可以选择某一个 Channel，然后做些事情。

一个线程可以对应一个selector，而一个selector可以轮询多个Channel，而每个Channel对应了一个Socket。

与上面一个线程对应一个Socket相比，使用NIO后，一个线程可以轮询多个Socket。

当selector调用select()时，会查看是否有客户端准备好了数据。当没有数据被准备好时，select()会阻塞。平时都说NIO是非阻塞的，但是如果没有数据被准备好还是会有阻塞现象。



```
sun.nio.ch.DefaultSelectorProvider
public static SelectorProvider create() {
        String osname = AccessController.doPrivileged(
            new GetPropertyAction("os.name"));
        if ("SunOS".equals(osname)) {
            return new sun.nio.ch.DevPollSelectorProvider();
        }
        // use EPollSelectorProvider for Linux kernels >= 2.6
        if ("Linux".equals(osname)) {
            String osversion = AccessController.doPrivileged(
                new GetPropertyAction("os.version"));
            String[] vers = osversion.split("\\.", 0);
            if (vers.length >= 2) {
                try {
                    int major = Integer.parseInt(vers[0]);
                    int minor = Integer.parseInt(vers[1]);
                    if (major > 2 || (major == 2 && minor >= 6)) {
                        return new sun.nio.ch.EPollSelectorProvider();
                    }
                } catch (NumberFormatException x) {
                    // format not recognized
                }
            }
        }
        return new sun.nio.ch.PollSelectorProvider();
}
```


NIO的读写过程依然在应用线程里完成，所以对于那些读写过程时间长的，NIO就不太适合。

而AIO的读写过程完成后才被通知，所以AIO能够胜任那些重量级，读写过程长的任务。

