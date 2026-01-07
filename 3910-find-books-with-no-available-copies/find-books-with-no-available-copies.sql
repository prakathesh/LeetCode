# Write your MySQL query statement below
select b.book_id,l.title,l.author,l.genre,l.publication_year,l.total_copies as current_borrowers
from library_books l right join borrowing_records b
on l.book_id=b.book_id
where b.return_date is null
group by b.book_id
having count(b.book_id)=current_borrowers
order by current_borrowers desc,l.title asc;