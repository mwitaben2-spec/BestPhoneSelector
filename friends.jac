node Person {
    has name:str;
} 

edge Friend {}
edge Family {}

with entry {
    p1 = Person(name="Ben");
    p2 = Person(name="Jose");

    root ++>p1;
    p1 +>:Friend:+> p2;
}