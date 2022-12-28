/* Electives Advisory System in Prolog for BTech or MTech student of IIITD */

bcse(['Mobile Computing','Security & Privacy','Computer Architecture','Data Analytics','Image Analysis & Machine Learning']).
bece(['Communication Systems','Signal Processing' ,'Hardware','Internet of Things' ,'Economics','Image Analysis & Machine Learning']).
bcsam(['Number Theory','Advanced Programming','Signals and Systems','Artificial Intelligence']).
bcsd(['Computer graphics','Data visualization','Image Processing','Computer vision','Machine learning','Affective Computing','Animation principles and design','Virtual reality' ]).
bcsss(['Machine Learning','Deep Learning','Big Data Analytics','Image Processing','Privacy and Security in Online Social Media','Convex Optimization']).

mcse(['Advanced Algorithms','Graduate Algorithms' ,'Mobile Computing','Wireless Networks','Compilers','Information Retrieval','Computer Architecture','Program Analysis']).
mece(['Wireless communication','Modelling of 5G','Communication Networks','Radar Systems','Image Processing','Machine learning']).
mcb(['Big data mining in healthcare','Machine learning in Bio medical Applications','Datascience in genomics','Network science']).

start:- write('HELLO!'),
     nl, 
     write('This is an Elective Advisory System'),
     nl, 
    questions,
    suggest(Elective),
    (Elective\==none -> write("Recommendation:- "),write(Elective),nl,true ; 
    write('Not able to recommend any Elective')),nl,
    end.

:-dynamic allocation/1.

questions:-
        write('Are you currently persuing B.Tech. or M.Tech.?'),nl,
        read(Answer),nl, assert(allocation(degree(Answer))),
        ((Answer == btech)->btech ; (Answer == mtech)->mtech),nl,
        write('What is your CGPA?'),nl, read(N),nl,assert(allocation(gpa(N))),nl,
        (allocation(degree(btech))->branch_specific_question_for_btech ;
        allocation(degree(mtech))->branch_specific_question_for_mtech).
        
branch_specific_question_for_btech :-
        (allocation(branch(cse)) -> ( write('What Carrer Do You Want To Persue From The Given Choices:- '),nl,
                                write('1. Data Analyst/Machine Learning'),nl,write('2. Security and Privacy Engineer'),nl,write('3. Mobile Application Developer'),nl,read(Z),nl, assert(allocation(career(Z))), 
                                write('Do you have interest in security and privacy?'),nl,read(V),assert(allocation(security(V))),nl,
                                write('Do you have interest in computer architechture?'),nl,read(J),assert(allocation(archi(J))),nl,
                                write('Do you have interest in data analysis and machine learning?'),nl,read(F),assert(allocation(ml(F))),assert(allocation(da(F))),nl,
                                write('Do you have interest in designing, development and evaluation of mobile applications?'),nl,read(O),assert(allocation(mobile(O))),nl));

        (allocation(branch(ece)) -> (write('What Carrer Do You Want To Persue From The Given Choices:- '),nl,
                                write('1. In AI/Machine Learning'),nl,write('2. Finance and Economics'),nl,write('3. Hardware Profile'),nl,read(Z),nl, assert(allocation(career(Z))), 
                                write('Do you want to explore artificial intelligence and machine learning domain?'),nl,read(W),assert(allocation(ml(W))),nl,
                                write('Do you want to learn about signal processing and signal analysis?'),nl,read(P),assert(allocation(signal(P))),nl,
                                write('Do you want interest in leaning about communication systems?'),nl,read(G),assert(allocation(comm(G))),nl,
                                write('Do you have interest in finanace and global economics?'),nl,read(U),assert(allocation(eco(U))),nl,
                                write('Do you have interest in hardware stuff and learning how it works?'),nl,read(T),assert(allocation(hardware(T))),nl,
                                write('Do you want to learn about IoT(Internet Of Things) and explore that field?'),nl,read(P),assert(allocation(iot(P))),nl));
        
        (allocation(branch(csam)) ->(write('What Carrer Do You Want To Persue From The Given Choices:- '),nl,
                                write('1. In AI/Machine Learning'),nl,write('2. Software Developer'),nl,write('3. Higher Studies in Maths'),nl,read(Z),nl, assert(allocation(career(Z))), 
                                write('Do you want to discover and explore Artificial Intelligence?'),nl,read(E),assert(allocation(ai(E))),nl,
                                write('Do you want to dig deep in maths and learn the concepts of Number Theory?'),nl,read(Q),assert(allocation(nt(Q))),nl,
                                write('Do you want to learn about signal processing and signal analysis?'),nl,read(J),assert(allocation(signal(J))),nl,
                                write('Do you have interest in OOPs(Object Oriented Programing) and want to learn various techniques such as abstration, encapsulation and inheritance?'),nl,read(S),assert(allocation(ap(S))),nl));
        
        (allocation(branch(csss)) -> (write('What Carrer Do You Want To Persue From The Given Choices:- '),nl,
                                write('1. In AI/Machine Learning'),nl,write('2. Image Processing'),nl,write('3. Security and Privacy Engineer'),nl,read(Z),nl, assert(allocation(career(Z))), 
                                write('Do you want to discover the machine learning field and try out how one can make machine learn and predict data?'),nl,read(P),assert(allocation(ml(P))),nl,
                                write('Do you have interest in deep learning?'),nl,read(M),assert(allocation(dl(M))),nl,
                                write('Do you want to learn how one can privacy and sercurity systems in social media world?'),nl,read(U),assert(allocation(sm(U))),nl,
                                write('Do you have interest in big data analytics?'),nl,read(H),assert(bd(H)),nl,
                                write('Do you have in image processing and transformation?'),nl,read(S),assert(allocation(ip(S))),nl,
                                write('Do you have interest in optimization problems and mathematical theory?'),nl,read(L),assert(allocation(co(L))),nl));
        
        (allocation(branch(csd))  -> (write('What Carrer Do You Want To Persue From The Given Choices:- '),nl,
                                write('1. In AI/Machine Learning'),nl,write('2. Image Processing'),nl,write('3. In Virtual Reality'),nl,read(Z),nl, assert(allocation(career(Z))), 
                                write('Do you have in image processing and transformation?'),nl,read(LK),assert(allocation(ip(LK))),nl,
                                write('Do you want to discover the machine learning field and try out how one can make machine learn and predict data?'),nl,read(P),assert(allocation(ml(P))),nl,
                                write('Do you have interest in computer graphics including necessary mathematics and algorithms? '),nl,read(B),assert(allocation(cg(B))),nl,
                                write('Do you want interest in visualization of data?'),nl,read(K),assert(allocation(dv(K))),nl,
                                write('Do you want to learn computer vision?'),nl,read(L),assert(allocation(cv(L))),nl,
                                write('Do you have interest in virtual reality?'),nl,read(BJ),assert(allocation(vr(BJ))),nl,
                                write('Do you have interest in animation?'),nl,read(PO),assert(allocation(a(PO))),nl)).

branch_specific_question_for_mtech:-                         
        (allocation(branch(cse)) -> (write('What Carrer Do You Want To Persue From The Given Choices:- '),nl,
                                write('1. Software Developer'),nl,write('2. Wireless Network Engineer'),nl,write('3. Mobile Application Developer'),nl,read(Z),nl, assert(allocation(career(Z))), 
                                write('Do you have interest in designing, development and evaluation of mobile applications?'),nl,read(O),assert(allocation(mobile(O))),nl,
                                write('Do you have interest in computer architechture?'),nl,read(J),assert(allocation(archi(J))),nl,
                                write('Do you interest in learning advanced/high level algorithms?'),nl,read(IO),assert(allocation(aa(IO))),assert(allocation(ga(IO))),nl,
                                write('Are you interested in learning about compilers and how they actually work?'),nl,read(YU),assert(allocation(compilers(YU))),nl,
                                write('Do you have interest knowing how wireless networks work?'),nl,read(KL),assert(allocation(wn(KL))),nl));

        (allocation(branch(ece)) -> (write('What Carrer Do You Want To Persue From The Given Choices:- '),nl,
                                write('1. In AI/Machine Learning'),nl,write('2. Image Processing'),nl,write('3. Wireless Network Engineer'),nl,read(Z),nl, assert(allocation(career(Z))), 
                                write('Do you have interest in image processing and transformation?'),nl,read(S),assert(allocation(ip(S))),nl,
                                write('Do you want to discover the machine learning field and try out how one can make machine learn and predict data?'),nl,read(P),assert(allocation(ml(P))),nl,
                                write('Do you have interest in Modelling of 5G network?'),nl,read(L),assert(allocation(mod(L))),nl,
                                write('Are you interested in learning more about wireless communication?'),nl,read(O),assert(allocation(wc(O))),nl,
                                write('Do you have interest in communication networks and how it actually works?'),nl,read(P),assert(allocation(cn(P))),nl));

        (allocation(branch(cb))  -> (write('What Carrer Do You Want To Persue From The Given Choices:- '),nl,
                                write('1. Big Data Mining In Healthcare'),nl,write('2. Machine Learning in Healthcare'),nl,read(Z),nl, assert(allocation(career(Z))), 
                                write('Are you interested in learning big data mining for its application in healthcare?'),nl,read(L),assert(allocation(bdh(L))),nl,
                                write('Do you have a interest in discovering more about genes and its cure in various disesases?'),nl,read(M),assert(allocation(g(M))),nl,
                                write('Are you willing to learn machine learning in order to apply it in healthcare system and improvise it?'),nl,read(O),assert(allocation(mlba(O))),nl,
                                write('Are you interest in studying about network science?'),nl,read(H),assert(allocation(ns(H))),nl)).
                               
print([],_).
print([Head|Tail], I) :-
    write(I), write(' '), write(Head), nl,
    M is I + 1,
    print(Tail, M).

btech :- write('What is your branch? (CSE,CSAM,CSD,CSSS,ECE)'),nl,
         read(Ans), assert(allocation(branch(Ans))),nl,
         write('The electives offered for your branch are as follows :-'),nl,
         (((Ans == cse)->bcse(X),print(X,1));
         ((Ans == csam)->bcsam(OP),print(OP,1));
         ((Ans == ece)->bece(X),print(X,1));
         ((Ans == csd)->bcsd(X),print(X,1));
         ((Ans == csss)->bcsss(X),print(X,1))).
mtech :- write('What is your branch? (CSE,ECE,CB)'),nl,
        read(Ans), assert(allocation(branch(Ans))),nl,
         write('The electives offered for your branch are as follows :-'),nl,
        (((Ans == cse) -> mcse(X),print(X,1));
        ((Ans == ece)->mece(X),print(X,1));
        ((Ans == cb)->mcb(X),print(X,1))).

suggest('Security & Privacy'):- (allocation(sercurity(yes));allocation(career(security_and_privacy_engineer))),allocation(branch(cse)),allocation(degree(btech)).
suggest('Mobile Computing'):- (allocation(mobile(yes));allocation(career(mobile_application_developer))),(((allocation(branch(cse)),allocation(degree(btech))));(allocation(branch(cse)),allocation(degree(mtech)))).
suggest('Computer Architecture'):- allocation(archi(yes)),allocation(branch(cse)).
suggest('Data Analytics'):- (allocation(da(yes));allocation(career(data_analyst/machine_learning))),(allocation(branch(cse));allocation(branch(csss))),allocation(degree(btech)).
suggest('Image Analysis & Machine Learning'):- allocation(ml(yes)),(allocation(branch(cse));allocation(branch(ece))),allocation(degree(btech)).
suggest('Communication Systems'):- allocation(comm(yes)),allocation(branch(ece)),allocation(degree(btech)).
suggest('Signal Processing'):- allocation(signal(yes)),allocation(branch(ece)),allocation(degree(btech)).
suggest('Hardware'):- (allocation(hardware(yes));allocation(career(hardware_profile))),allocation(branch(ece)),allocation(degree(btech)).
suggest('Internet of Things'):- allocation(iot(yes)),allocation(branch(ece)),allocation(degree(btech)).
suggest('Economics'):- (allocation(eco(yes));allocation(career(finance_and_economics))),allocation(branch(ece)),allocation(degree(btech)).
suggest('Advanced Programming'):- (allocation(ap(yes));allocation(career(software_developer))),allocation(branch(csam)),allocation(degree(btech)).
suggest('Signals and Systems'):- allocation(signal(yes)),allocation(branch(csam)),allocation(degree(btech)).
suggest('Artificial Intelligence'):- (allocation(ai(yes));allocation(career(in_ai/machine_learning))),allocation(branch(csam)),allocation(degree(btech)).
suggest('Number Theory'):- (allocation(nt(yes));allocation(career(higher_studies_in_maths))),allocation(branch(csam)),allocation(degree(btech)).
suggest('Computer graphics'):- allocation(cg(yes)),allocation(branch(csd)),allocation(degree(btech)).
suggest('Data visualization'):- allocation(dv(yes)),allocation(branch(csd)),allocation(degree(btech)).
suggest('Computer vision'):- allocation(cv(yes)),allocation(branch(csd)),allocation(degree(btech)).
suggest('Machine learning'):- (allocation(ml(yes));allocation(career(data_analyst/machine_learning))),(((allocation(branch(csd)),allocation(degree(btech))));(allocation(branch(ece)),allocation(degree(mtech)))).
suggest('Animation principles and design'):- allocation(a(yes)),allocation(branch(csd)),allocation(degree(btech)).
suggest('Virtual reality'):- (allocation(vr(yes));allocation(career(in_virtual_reality))),allocation(branch(csd)),allocation(degree(btech)).
suggest('Deep Learning'):- allocation(dl(yes)),allocation(branch(csss)),allocation(degree(btech)).
suggest('Big Data Analytics'):- allocation(bd(yes)),allocation(branch(csss)),allocation(degree(btech)).
suggest('Image Processing'):- (allocation(ip(yes));allocation(career(image_processing))),(((allocation(branch(csss));allocation(branch(csd))),allocation(degree(btech)));(allocation(branch(ece)),allocation(degree(mtech)))).
suggest('Privacy and Security in Online Social Media'):- allocation(sm(yes)),allocation(branch(csss)),allocation(degree(btech)).
suggest('Convex Optimization'):- allocation(co(yes)),allocation(branch(csss)),allocation(degree(btech)).
suggest('Advanced Algorithms'):- (allocation(aa(yes));allocation(career(software_developer))),allocation(branch(cse)),allocation(degree(mtech)).
suggest('Graduate Algorithms'):- (allocation(ga(yes));allocation(career(software_developer))),allocation(branch(cse)),allocation(degree(mtech)).
suggest('Wireless Networks'):- (allocation(wn(yes));allocation(career(wireless_network_engineer))),allocation(branch(cse)),allocation(degree(mtech)).
suggest('Compilers'):- allocation(compilers(yes)),allocation(branch(cse)),allocation(degree(mtech)).
suggest('Wireless communication'):- allocation(wc(yes)),allocation(branch(ece)),allocation(degree(mtech)).
suggest('Modelling of 5G'):- allocation(mod(yes)),allocation(branch(ece)),allocation(degree(mtech)).
suggest('Communication Networks'):- allocation(cn(yes)),allocation(branch(ece)),allocation(degree(mtech)).
suggest('Big data mining in healthcare'):- (allocation(bdh(yes));allocation(career(big_data_mining_in_healthcare))),allocation(branch(cb)),allocation(degree(mtech)).
suggest('Machine learning in Bio medical Applications'):- (allocation(mlba(yes));allocation(career(machine_learning_in_healthcare))),allocation(branch(cb)),allocation(degree(mtech)).
suggest('Datascience in genomics'):- allocation(g(yes)),allocation(branch(cb)),allocation(degree(mtech)).
suggest('Network science'):- allocation(ns(yes)),allocation(branch(ece)),allocation(degree(mtech)).
suggest('none').

func(X):-
    consult("file.pl"),
    suggest(X).

end :- retractall(allocation(_)).

