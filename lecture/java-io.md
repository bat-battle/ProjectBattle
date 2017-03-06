
## IO

1. Reader Writer : character streams
2. InputStream, OutputStream : byte streams
3. InputStreamReader, OutputStreamWriter : a bridge from character streams to byte streams
4. DataOutput, DataInput: reading(writing) bytes from a binary stream and reconstructing from them data in any of the Java primitive types

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

Buffer : a linear, finite sequence of elements of a specific primitive type
Channel : A nexus for I/O operations


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
