//! # Simple Linked List
//! 
//! This is a simple implementation of a singly-linked list.
use std::iter::FromIterator;

struct Node<T> {
    data: T,
    next: Option<Box<Node<T>>>,
}

/// A simple singly-linked list.
pub struct SimpleLinkedList<T> {
    head: Option<Box<Node<T>>>,
}

/// Simple implementation of a singly-linked list.
/// 
/// # Examples
/// 
/// ```
/// use simple_linked_list::SimpleLinkedList;
/// 
/// let mut list = SimpleLinkedList::new();
/// assert_eq!(list.len(), 0);
/// assert_eq!(list.is_empty(), true);
/// 
/// list.push(1);
/// assert_eq!(list.len(), 1);
/// 
/// let x = list.peek();
/// assert_eq!(x, Some(&1));
/// 
/// let y = list.pop();
/// assert_eq!(y, Some(1));
/// assert_eq!(list.len(), 0);
/// 
/// list.push(1);
/// list.push(2);
/// let mut reversed = list.rev();
/// assert_eq!(reversed.pop(), Some(1));
/// assert_eq!(reversed.pop(), Some(2));
/// assert_eq!(reversed.pop(), None);
/// ```
impl<T> SimpleLinkedList<T> {
    /// Create a new, empty linked list.
    pub fn new() -> Self {
        return SimpleLinkedList { head: None };
    }

    /// Get the head of the linked list.
    pub fn is_empty(&self) -> bool {
        return self.head.is_none();
    }

    /// Get the length of the linked list.
    pub fn len(&self) -> usize {
        let mut l = 0;
        let mut current = &self.head;
        while let Some(node) = current {
            l += 1;
            current = &node.next;
        }
        return l;
    }

    /// Push an element onto the front of the list.
    pub fn push(&mut self, _element: T) {
        let new_head = Box::new(Node {
            data: _element,
            next: self.head.take(),
        });
        self.head = Some(new_head);
    }

    /// Remove the first element and return it, or `None` if the list is empty.
    pub fn pop(&mut self) -> Option<T> {
        let current = self.head.take();
        match current {
            Some(node) => {
                self.head = node.next;
                return Some(node.data);
            }
            None => return None,
        }
    }

    /// Return a reference to the first element, or `None` if the list is empty.
    pub fn peek(&self) -> Option<&T> {
        match &self.head {
            Some(node) => return Some(&node.data),
            None => return None,
        }
    }

    /// Return an iterator over the elements of the list.
    #[must_use]
    pub fn rev(self) -> SimpleLinkedList<T> {
        let mut new_list = SimpleLinkedList::new();
        let mut current = self.head;
        while let Some(node) = current {
            new_list.push(node.data);
            current = node.next;
        }
        return new_list;
    }
}

/// From an iterator to SimpleLinkedList.
/// 
/// # Examples
/// 
/// ```
/// use simple_linked_list::SimpleLinkedList;
/// 
/// let mut list = SimpleLinkedList::from_iter(vec![1, 2, 3]);
/// assert_eq!(list.len(), 3);
/// assert_eq!(list.pop(), Some(3));
/// assert_eq!(list.pop(), Some(2));
/// assert_eq!(list.pop(), Some(1));
/// assert_eq!(list.pop(), None);
/// ```
impl<T> FromIterator<T> for SimpleLinkedList<T> {
    fn from_iter<I: IntoIterator<Item = T>>(_iter: I) -> Self {
        let mut list = SimpleLinkedList::new();
        for item in _iter {
            list.push(item);
        }
        return list;
    }
}

/// From SimpleLinkedList to Vec.
/// 
/// # Examples
/// 
/// ```
/// use simple_linked_list::SimpleLinkedList;
/// 
/// let list = SimpleLinkedList::from_iter(vec![1, 2, 3]);
/// let v: Vec<i32> = list.into();
/// assert_eq!(v, vec![1, 2, 3]);
/// ```
impl<T> From<SimpleLinkedList<T>> for Vec<T> {
    fn from(mut _linked_list: SimpleLinkedList<T>) -> Vec<T> {
        let mut vec = Vec::new();
        while let Some(item) = _linked_list.pop() {
            vec.push(item);
        }
        return vec.into_iter().rev().collect();
    }
}
