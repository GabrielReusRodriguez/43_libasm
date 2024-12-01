/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libft.h                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gabriel <gabriel@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/02 20:37:22 by greus-ro          #+#    #+#             */
/*   Updated: 2024/12/01 18:37:37 by gabriel          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBFT_H
# define LIBFT_H

# include <stddef.h>
# include <stdbool.h>

/*
	Errors
*/
void	ft_err_error(const char *msg);
void	ft_err_warning(const char *msg);
void	ft_err_errno(const char *msg);

/*
	Pointers
*/
void	*ft_ptr_free(void *ptr);
char	*ft_ptr_new_char_buffer(size_t size);
void	*ft_ptr_free_dchar_ptr(char **ptr);

/*
	Memory
*/
void	ft_bzero(void *s, size_t n);
void	*ft_calloc(size_t nmemb, size_t size);
void	*ft_memcpy(void	*dest, const void *src, size_t n);
void	*ft_memchr(const void *s, int c, size_t n);
int		ft_memcmp(const void *s1, const void *s2, size_t n);
void	*ft_memset(void	*s, int c, size_t n);
void	*ft_memmove(void *dest, const void *src, size_t n);

/*
	Data types
*/
int		ft_isalpha(int c);
int		ft_isalnum(int c);
int		ft_isascii(int c);
int		ft_isdigit(int c);
int		ft_islower(int c);
int		ft_isprint(int c);
int		ft_isupper(int c);

/*
	Conversions
*/
int		ft_atoi(const char *nbr);
int		ft_atoi_base(const char *str, int str_base);
long	ft_atol(const char *nbr);
char	*ft_itoa(int n);
char	*ft_utoa(unsigned int n);
char	*ft_dtoh(unsigned long u_number, unsigned int up_case);
char	*ft_htoa(unsigned long long num, bool upcase);

/*
	Prints
*/
int		ft_iputchar_fd(char c, int fd);
int		ft_iputstr_fd(char *s, int fd);
int		ft_iputendl_fd(char *s, int fd);
int		ft_iputnbr_fd(int n, int fd);

void	ft_putchar_fd(char c, int fd);
void	ft_putstr_fd(char *s, int fd);
void	ft_putendl_fd(char *s, int fd);
void	ft_putnbr_fd(int n, int fd);
int		ft_write(int fd, const void *buf, size_t count);
int		ft_read(int fd, void *buf, size_t count);
/*
	Text functions
*/
char	**ft_split(char const *s, char c);
char	*ft_strdup(const char *s);
void	ft_striteri(char *s, void (*f)(unsigned int, char*));
char	*ft_strjoin(char const *s1, char const *s2);
size_t	ft_strlcat(char *dst, const char *src, size_t size);
size_t	ft_strlen(const char *s);
size_t	ft_strlcpy(char *dst, const char *src, size_t size);
char	*ft_strcpy(char *dst, const char *src);
char	*ft_strmapi(char const *s, char (*f)(unsigned int, char));
int		ft_strcmp(const char *str1, const char *str2);
int		ft_strncmp(const char *s1, const char *s2, size_t n);
char	*ft_strnstr(const char *big, const char *little, size_t len);
char	*ft_strchr(const char *s, int c);
char	*ft_strrchr(const char *s, int c);
char	*ft_strtrim(char const *s1, char const *set);
char	*ft_substr(char const *s, unsigned int start, size_t len);
int		ft_istrchr(char *src, char *c);

int		ft_toupper(int c);
int		ft_tolower(int c);

/*Bonus Part*/
typedef struct s_list
{
	void			*content;
	struct s_list	*next;
}	t_list;

void	ft_lstadd_back(t_list **lst, t_list *new);
void	ft_lstadd_front(t_list **lst, t_list *new);
void	ft_list_push_front(t_list **lst, t_list *new);
int		ft_list_size(t_list *lst);
void	ft_list_sort(t_list **begin_list, int (*cmp)());
void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)());
void	ft_lstclear(t_list **lst, void (*del)(void*));
void	ft_lstdelone(t_list *lst, void (*del)(void*));
void	ft_lstiter(t_list *lst, void (*f)(void *));
t_list	*ft_lstlast(t_list *lst);
t_list	*ft_lstmap(t_list *lst, void *(*f)(void *), void (*del)(void *));
t_list	*ft_lstnew(void *content);
int		ft_lstsize(t_list *lst);
void	ft_lstdel_back(t_list **lst);
void	ft_lstdel_front(t_list **lst);
int		ft_lstcontains(t_list *list, void *content, int (*f)(void *c1, \
			void *c2));

#endif