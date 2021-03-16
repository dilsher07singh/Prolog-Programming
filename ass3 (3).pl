/* Singh Dilsher ,dsingh, SID:20545381*/

/*QUESTION 1*/



sq_sum([Head|Tail],Summation):-listSQ([Head|Tail],G), summation_list(G,Summation).


m_sum(List_A,List_B,Summation):-list_Mult(List_A,List_B,G), summation_list(G,Summation).


listSQ([],[]).
listSQ([Head|Tail],[Head_SQ|Tail_SQ]):- listSQ(Tail,Tail_SQ), Head_SQ is Head*Head.


summation_list([],0).
summation_list([Head|Tail],Ans_Sum):- summation_list(Tail,NewAns), Ans_Sum is Head+NewAns.

list_Mult([],[],[]).
list_Mult([Head_A|Tail_A],[Head_B|Tail_B],[Ans_MultH|Ans_MultT]):-list_Mult(Tail_A,Tail_B,Ans_MultT), Ans_MultH is Head_A*Head_B.



a_slope(List_A,List_B,Slope):- m_sum(List_A,List_B,XY_Sum),
                summation_list(List_A,X_Sum),
                summation_list(List_B,Y_Sum),
                length(List_A,Length_N),
                sq_sum(List_A,Sq_Sum),
                summation_list(List_A,X_Sum),


                Slope is (Length_N*XY_Sum-X_Sum*Y_Sum)/(Length_N*Sq_Sum-X_Sum*X_Sum).


b_intercept(List_A,List_B,Intercept):-  summation_list(List_B,Y_Sum),
                sq_sum(List_A,Sq_Sum),
                summation_list(List_A,X_Sum),
                m_sum(List_A,List_B,XY_Sum),

            
                length(List_A,Len_N),

           

                Intercept is (Y_Sum*Sq_Sum-X_Sum*XY_Sum)/(Len_N*Sq_Sum-X_Sum*X_Sum).


linear_regression(A,B):- xs(X),ys(Y),a_slope(X,Y,A), b_intercept(X,Y,B).





/* QUESTION 2 */


/* Get different edges and control all the way*/

edge1checkout(D, RESULT) :- findall(INNEW, edge(D, INNEW), RESULT).

edge1(G) :-     edge(_, G), !.
edge0(G) :- edge(G, _), !.

get_ATT(edge,ANS):-
                check(edge,A).




/* Get different displace and move and control all the way*/
/* Get different edges and control all the way*/
/* store in size*/
small_displace(First, Second, Size) :-  findall(VAL, getP_EDGE(First, Second,_, VAL),NEWANS), 
                    sort(NEWANS, [Size|_]).

/* check vals and change*/
/* Small member functions and their particular outputs*/
displace_lenval(FIRST, SECOND) :-           findall(VALUES, (member(DC,FIRST), secondCheck_Con(DC, VALUES)),SECOND).

/* edges and maintenance of edge control*/
getP_EDGE(FIRST, SECOND, CHANGE, GOT, RESULT) :-    attatched_edge(FIRST, VAL_L), 
                            member(J, VAL_L), \+member(J, CHANGE),


                        getP_EDGE(J, SECOND, [FIRST|CHANGE], GOT, FINFIN), 

                        RESULT is 1+FINFIN.


ensure(edge,B):-
                move(LAST,B),
                isE(SS,Q).



/* Get dense edge*/

vert_large(GET) :- value_deg(GET, NEWA),
                NEWA > 2.
/* Get short edges*/
vert_small(GET) :- value_deg(GET, Y),
                Y =< 2.

ensureACD(edge,B):-
                move(LAST,B),
                check(edge,C),
                isE(SS,Q).


/* Get different attatchments sort and move*/

getP_EDGE(FIRST, SECOND, INP, RES) :-       attatched_edge(FIRST, DC), 
                        member(MEM, DC),
                        getP_EDGE(MEM, SECOND, [FIRST], INP, LASTLAST),
                        RES is 1+LASTLAST.  


/* Get different edges and control all the way*/

value_deg(FIRST, RES_D) :-  attatched_edge(FIRST, GET_L),
                length(GET_L, RES_D),
                \+ RES_D == 0.

/*same edge with different variables to check other conditions cut in the end though*/
getP_EDGE(FIRST, SECOND, VAL, 1) :-     edge(FIRST, SECOND), 
                    append([], SECOND, VAL),!.

/*large search overall and find basis*/
search_LargeN(VAR, DL) :-     findall(Q, (char_type(Q, alpha), get_EdgeI(Q),vert_large(Q)), OLD),
            findall(Y, (member(Y, OLD), \+ Y == VAR, getP_EDGE(VAR, Y, _, _)), FINAFINA),
             sort(FINAFINA, DL).


last_final_CONDITION(edge,LIST):-
                small_displace(edge,TEMPLIST),
                LIST is TEMPLIST.



/*this function ensures arrangement of result for part collision*/
confirmcheck_2C(RESULT) :-      findall(VAL, (char_type(VAL,alpha),get_EdgeI(VAL), secondCheck_Con(VAL,_)), STO), 
                
                    sort(STO, RESULT). 

/* check const conditions and overlap*/
attatched_edge(FIRST, RES) :-                                edge2checkin(FIRST, TRUE),

    edge1checkout(FIRST, FALSE),

                append(FALSE,TRUE, RES).
/*similiar approach but ultimate changes for final res */
edge2checkin(FIRST, RES) :- findall(HO, edge(HO, FIRST), RES).

/* get edge and append based on reversal*/
getP_EDGE(SAME, SAME, T_GO, RES, 0) :-       append([SAME], T_GO, NEW),
                                             reverse(NEW, RES),!.


second_ffinal_CONDITION(edge,LIST):-
                ensureACD(edge,TEMPLIST),
                check(edge,TEMPLIST),
                LIST is TEMPLIST.


/*get all the members of vertices in firstl and then output basis*/
getMembers_DN(FIRSTL, vertices) :-                                vert_large(vertices),

member(vertices, FIRSTL).

/* get both vals and correspond to connected edges */

/*move and motion constantized keep checking for all*/

/*get both edges based on such conditions as well*/
get_EdgeI(EDGE) :-            edge1(EDGE).
/* similiar */
get_EdgeI(EDGE) :-            edge0(EDGE).


last_final_MOVEMENT(edge,LIST):-
                small_displace(edge,TEMPLIST),
                LIST is TEMPLIST.



/*this is the second checker and is used for constant checking of edge and sparse and density*/
secondCheck_Con(VAR, RES) :-        search_LargeN(VAR, DL),length(DL, VAN),
                VAN >=2, findall(RES, (member(Y,DL), small_displace(VAR,Y,RES)), POR),

                msort(POR, LAST), append([], LAST, [J,K|_]), J == K,


                RES is J.

/*last edge checker in detail move */ 

last_edge_checker(FIRST) :-     confirmcheck_2C(ANS),displace_lenval(ANS, REMOVE),

                    sort(REMOVE, [G|_]), 

FIRST == G.



/* run and call based on this insurance for each edge */
interesting(ED) :-      char_type(ED, alpha), get_EdgeI(ED), vert_small(ED),
                    secondCheck_Con(ED, AN), last_edge_checker(AN).





















/* QUESTION 3*/


family_m(A,[A|_]).
family_m(A,[_|B]) :- family_m(A,B).



smaller_E(First,Second) :- atom_elements(First,Second,_).


ionic(First,Second) :-
atom_elements(First,_,Dont_Care),
family_m(Second,Dont_Care).




chthree_checker(Get) :-
smaller_E(Get,carbon),
ionic(Get,HA), smaller_E(HA,hydrogen),

ionic(Get,HB), smaller_E(HB,hydrogen), HA \== HB,

ionic(Get,HC), smaller_E(HC,hydrogen), HC \== HA,

HC \== HB.

ch3(X):- findall(Old_ans, chthree_checker(Old_ans),  New_ans), 
	sort(New_ans, X).







/* Question 4- Use brute force method and apply accordingly */
check_six_C([A1,A2,A3,A4,A5,A6],GetVal) :-

smaller_E(A1,carbon), ionic(A1,A2),

smaller_E(A2,carbon), ionic(A2,A3), A1 \== A3,

smaller_E(A3,carbon), ionic(A3,A4),
\+ family_m(A4,[A1,A2,A3]),


smaller_E(A4,carbon), ionic(A4,A5),
\+ family_m(A5,[A1,A2,A3,A4]),


smaller_E(A5,carbon), ionic(A5,A6),

smaller_E(A6,carbon), ionic(A6,A1),
\+ family_m(A6,[A1,A2,A3,A4,A5]),



sort([A1,A2,A3,A4,A5,A6],GetVal).



c6ring(X):-findall(Old,check_six_C(C,Old),New),
		sort(New,X).





/*Question 5 */



/*if else statements with condition checking */
show_N([],GET,GET).
show_N([Head|Tail], H , Y):- smaller_E(Head,MAINT) ,
				 MAINT == nitrogen -> 
				attatch_end(H,Head,FINAL),

				 show_N(Tail,FINAL,Y);
				 show_N(Tail,H,Y).



/* Appending for the ending is essential */
attatch_end([],G,[G]).
attatch_end([Head|Tail],Action,[Head|Lastfew]):-attatch_end(Tail,Action,Lastfew).



/*Nitro grp check */
/*Nitro-oxy checkkk maintains a constant loop to add and remove*/

nitro_carbon_ring(Check, A) :-          benzene(Check,Temp_List),
                                        family(Ca, Temp_List),
                                        bond(Ca, N), nitro(N),
                                        add_tail([],Ca,B),
                                        add_tail([], N, Dss),
                                        append(B, Dss, Z),
                                        findall(Os, check_nitro_bond(N, Os), Temp),
                                        elem(Os, oxygen),
                                        append(Z, Temp, A).


/* Ciunter which helps to get length and keep constant track */

main_C(FIRST, SECOND, THIRD) :-
    include(=(SECOND), FIRST, Small_Check), 
	length(Small_Check, THIRD).


/*Nitrobonding way using methods and definition above*/

cnitrosold_bond(X, Y) :-               elem(Y, oxygen),
                                        bond(X, Y).
/*Nitro-oxy checkkk maintains a constant loop to add and remove*/


/*Check and display O */
show_O([],Get,Get).
show_O([Head|Tail], H , Y):- smaller_E(Head,MAINT) , 
				MAINT == oxygen ->
				 attatch_end(H,Head,FINAL), 
					show_O(Tail,FINAL,Y);
					 show_O(Tail,H,Y).


/*Nitro-oxy checkkk maintains a constant loop to add and remove*/
/*Nitro-oxy checkkk maintains a constant loop to add and remove*/

nitrooxycheckkkk_carbon_ring(Check, A) :-          benzene(Check,Temp_List),
                                        family(Ca, Temp_List),
                                        bond(Ca, N), nitro(N),
                                        add_tail([],Ca,B),
                                        add_tail([], N, Dss),
                                        append(B, Dss, Z),
                                        findall(Os, check_nitro_bond(N, Os), Temp),
                                        elem(Os, oxygen),
                                        append(Z, Temp, A).
/*Nitro-oxy checkkk maintains a constant loop to add and remove*/


/* NO2 checker which is essential for the program in terms of display and counting */
show_NOO(D,F,Z):- atom_elements(D,carbon,W),
	convlist([A,B]>>(smaller_E(A,B)), W, J),
	main_C(J,nitrogen,NITRO),
	NITRO==1 -> 

	show_N(W,[],[Head|Tail]),


	 checker_O(Head,V),

	 attatch_end(F,D,CHANGE),
	 attatch_end(CHANGE,Head,NEW), 
	append(NEW,V,Z).



/* This calculates and checks O'S overall */
checker_O(FIRST,SECOND):- atom_elements(FIRST,nitrogen,CHECKER_N),
				show_O(CHECKER_N,[],SECOND),
					length(SECOND,GET_L),
						GET_L==2.


/* temporary checker for future correspondednce */
temp_check(A) :-                        elem(A, carbon),
                                        bond(A, D),
                                        \+check_element(D, nitrogen).



/*carbon not nitrogen checker */
carbon_not_connected_to_nitrogen(Check, R):-
                                      	benzene(Check,Temp_List),
                                        bond(C, Temp_List),
                                        findall(Ans, temp_check(Ans), A),
                                        sort(A, Ans).



/* first check connections and then recursively perform other checks */
connections([],GET,GET).
connections([Head|Tail],A,B):- show_NOO(Head,[],Last_N)-> 
				attatch_end(A,Last_N,Y),
				connections(Tail,Y,B); 
				attatch_end(A,Head,Y),
				 connections(Tail,Y,B).

/*Function for nitrogen bond checking scratch code */
nitroforalll(N) :-                             element(N,nitrogen),
                                        bond(N,O1),
                                       element(O2, oxygen),

                                        element(O1,oxygen),
                                        bond(N, O2),
                                        O1 \== O2.





tnt(X):- c6ring([Head|Tail]),connections(Head,[],X).









