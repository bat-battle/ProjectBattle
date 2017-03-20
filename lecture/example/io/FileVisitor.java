import java.io.IOException;
import java.nio.file.FileVisitResult;
import java.nio.file.Path;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.ArrayList;
import java.util.List;
import java.nio.file.Paths;
import java.nio.file.Files;

public class FileVisitor extends SimpleFileVisitor<Path> {
    private List<String> fileList = new ArrayList<String>();
    private List<String> dirList = new ArrayList<String>();

    @Override
    public FileVisitResult postVisitDirectory(Path dir, IOException exec)
            throws IOException {
        // 访问文件夹之前调用
        //System.out.println("Just visited " + dir);
        return FileVisitResult.CONTINUE;
    }

    @Override
    public FileVisitResult preVisitDirectory(Path dir, BasicFileAttributes attrs)
            throws IOException {
        // 访问文件夹之后调用
        //System.out.println("About to visit " + dir);
        return FileVisitResult.CONTINUE;
    }

    @Override
    public FileVisitResult visitFile(Path file, BasicFileAttributes attrs)
            throws IOException {
        // 访问文件后调用
        System.out.println("trave " + file);
        if (attrs.isRegularFile()) {
            fileList.add(file.getFileName().toString());
        } else if (attrs.isDirectory()) {
            dirList.add(file.getFileName().toString());
        }
        return FileVisitResult.CONTINUE;
    }

    @Override
    public FileVisitResult visitFileFailed(Path file, IOException exc)
            throws IOException {
        // 文件不可访问时调用
        //System.out.println(exc.getMessage());
        return FileVisitResult.CONTINUE;
    }

    public List<String> getFiles() {
           return fileList;
    }

    public List<String> getDirs() {
           return dirList;
    }

    public static void main(String[] args) throws IOException {
        Path fileDir = Paths.get(".");
        System.out.println(fileDir.toAbsolutePath().toString());
        FileVisitor visitor = new FileVisitor();
        Files.walkFileTree(fileDir.toAbsolutePath(), visitor);
        List<String> files = visitor.getFiles();
        for(String f : files) {
            System.out.println("file " + f);
        }
        List<String> dirs = visitor.getDirs();
        for(String d : dirs) {
            System.out.println("dir " + d);
        }
    }

}
