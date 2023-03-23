package Student;

public class StudentTest {
    public static void main(String[] args)
    {
        Student s1=new Student();
        Student s2=new Student();
        Student s3=new Student();
        Student s4=new Student();
        Student s5=new Student();

        s1.setRollNumber(27);
        s1.setName("Himanshi");
        s1.setCourse("C");
        s1.setMarks1(81);
        s1.setMarks2(95);
        s1.setMarks3(80);

        s2.setRollNumber(28);
        s2.setName("Paridhi");
        s2.setCourse("C++");
        s2.setMarks1(98);
        s2.setMarks2(56);
        s2.setMarks3(87);

        s3.setRollNumber(29);
        s3.setName("Surbhi");
        s3.setCourse("R");
        s3.setMarks1(78);
        s3.setMarks2(72);
        s3.setMarks3(97);

        s4.setRollNumber(30);
        s4.setName("Parul");
        s4.setCourse("Java");
        s4.setMarks1(78);
        s4.setMarks2(86);
        s4.setMarks3(97);

        s5.setRollNumber(31);
        s5.setName("Aanshi");
        s5.setCourse("Go");
        s5.setMarks1(87);
        s5.setMarks2(70);
        s5.setMarks3(92);

        System.out.println(s1);
        System.out.println(s1.calculateGrade());

        System.out.println(s2);
        System.out.println(s2.calculateGrade());

        System.out.println(s3);
        System.out.println(s3.calculateGrade());

        System.out.println(s4);
        System.out.println(s4.calculateGrade());

        System.out.println(s5);
        System.out.println(s5.calculateGrade());
    }
}
