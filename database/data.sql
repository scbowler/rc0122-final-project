insert into users
  ("firstName", "lastName", "email", "password")
  values
    ('Jim', 'Bob', 'jim@mail.com', 'asdf'),
    ('Gina', 'Smith', 'gina@mail.com', 'asdf');

insert into entries
  ("title", "photoUrl", "notes", "userId")
  values
    ('I like bunnies', 'https://i.natgeofe.com/n/974b845a-bd6a-46a7-bae2-0dd690602821/03_rescue_bunnies_4x3.jpg', 'Bunnies are awesome!', 1),
    ('Puppies!', 'https://www.akc.org/wp-content/uploads/2017/11/Labrador-Retriever-MP-500x486.jpg', 'Puppies are the best!', 1),
    ('JavaScript', 'https://images.ctfassets.net/yr4qj72ki4ky/legacyBlogPost77Thumbnail/cd4783ad7b35efc4367166a570a9952e/bigstock-Real-Java-Script-Code-Developi-217215433.jpg?q=72', 'JavaScript is the best programming language!', 1);
      
