package core;

public class User {
   private Integer id;
   private String name;
   private String pass;
   private Integer age;
   public User() {
   }
   public User(String name, String pass, Integer age) {
       this.name = name;
       this.pass = pass;
       this.age = age;
   }
   public User(Integer id, String name, String pass, Integer age) {
       this.id = id;
       this.name = name;
       this.pass = pass;
       this.age = age;
   }
   public Integer getAge() {
       return age;
   }
   public void setAge(Integer age) {
       this.age = age;
   }
   public Integer getId() {
       return id;
   }
   public void setId(Integer id) {
       this.id = id;
   }
   public String getName() {
       return name;
   }
   public void setName(String name) {
       this.name = name;
   }
   public String getPass() {
       return pass;
   }
   public void setPass(String pass) {
       this.pass = pass;
   }
}