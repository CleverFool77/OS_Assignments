
_big:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"
#include "fcntl.h"

int
main()
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	81 ec 30 02 00 00    	sub    $0x230,%esp
  char buf[512];
  int fd, i, sectors;

  fd = open("big.file", O_CREATE | O_WRONLY);
   c:	c7 44 24 04 01 02 00 	movl   $0x201,0x4(%esp)
  13:	00 
  14:	c7 04 24 d8 09 00 00 	movl   $0x9d8,(%esp)
  1b:	e8 ac 04 00 00       	call   4cc <open>
  20:	89 84 24 24 02 00 00 	mov    %eax,0x224(%esp)
  if(fd < 0){
  27:	83 bc 24 24 02 00 00 	cmpl   $0x0,0x224(%esp)
  2e:	00 
  2f:	79 19                	jns    4a <main+0x4a>
    printf(2, "big: cannot open big.file for writing\n");
  31:	c7 44 24 04 e4 09 00 	movl   $0x9e4,0x4(%esp)
  38:	00 
  39:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  40:	e8 c7 05 00 00       	call   60c <printf>
    exit();
  45:	e8 42 04 00 00       	call   48c <exit>
  }

  sectors = 0;
  4a:	c7 84 24 28 02 00 00 	movl   $0x0,0x228(%esp)
  51:	00 00 00 00 
  while(1){
    *(int*)buf = sectors;
  55:	8d 44 24 1c          	lea    0x1c(%esp),%eax
  59:	8b 94 24 28 02 00 00 	mov    0x228(%esp),%edx
  60:	89 10                	mov    %edx,(%eax)
    int cc = write(fd, buf, sizeof(buf));
  62:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  69:	00 
  6a:	8d 44 24 1c          	lea    0x1c(%esp),%eax
  6e:	89 44 24 04          	mov    %eax,0x4(%esp)
  72:	8b 84 24 24 02 00 00 	mov    0x224(%esp),%eax
  79:	89 04 24             	mov    %eax,(%esp)
  7c:	e8 2b 04 00 00       	call   4ac <write>
  81:	89 84 24 20 02 00 00 	mov    %eax,0x220(%esp)
    if(cc <= 0)
  88:	83 bc 24 20 02 00 00 	cmpl   $0x0,0x220(%esp)
  8f:	00 
  90:	7f 56                	jg     e8 <main+0xe8>
      break;
  92:	90                   	nop
    sectors++;
	if (sectors % 100 == 0)
		printf(2, ".");
  }

  printf(1, "\nwrote %d sectors\n", sectors);
  93:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
  9a:	89 44 24 08          	mov    %eax,0x8(%esp)
  9e:	c7 44 24 04 0d 0a 00 	movl   $0xa0d,0x4(%esp)
  a5:	00 
  a6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  ad:	e8 5a 05 00 00       	call   60c <printf>

  close(fd);
  b2:	8b 84 24 24 02 00 00 	mov    0x224(%esp),%eax
  b9:	89 04 24             	mov    %eax,(%esp)
  bc:	e8 f3 03 00 00       	call   4b4 <close>
  fd = open("big.file", O_RDONLY);
  c1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  c8:	00 
  c9:	c7 04 24 d8 09 00 00 	movl   $0x9d8,(%esp)
  d0:	e8 f7 03 00 00       	call   4cc <open>
  d5:	89 84 24 24 02 00 00 	mov    %eax,0x224(%esp)
  if(fd < 0){
  dc:	83 bc 24 24 02 00 00 	cmpl   $0x0,0x224(%esp)
  e3:	00 
  e4:	79 68                	jns    14e <main+0x14e>
  e6:	eb 4d                	jmp    135 <main+0x135>
  while(1){
    *(int*)buf = sectors;
    int cc = write(fd, buf, sizeof(buf));
    if(cc <= 0)
      break;
    sectors++;
  e8:	83 84 24 28 02 00 00 	addl   $0x1,0x228(%esp)
  ef:	01 
	if (sectors % 100 == 0)
  f0:	8b 8c 24 28 02 00 00 	mov    0x228(%esp),%ecx
  f7:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  fc:	89 c8                	mov    %ecx,%eax
  fe:	f7 ea                	imul   %edx
 100:	c1 fa 05             	sar    $0x5,%edx
 103:	89 c8                	mov    %ecx,%eax
 105:	c1 f8 1f             	sar    $0x1f,%eax
 108:	29 c2                	sub    %eax,%edx
 10a:	89 d0                	mov    %edx,%eax
 10c:	6b c0 64             	imul   $0x64,%eax,%eax
 10f:	29 c1                	sub    %eax,%ecx
 111:	89 c8                	mov    %ecx,%eax
 113:	85 c0                	test   %eax,%eax
 115:	75 19                	jne    130 <main+0x130>
		printf(2, ".");
 117:	c7 44 24 04 0b 0a 00 	movl   $0xa0b,0x4(%esp)
 11e:	00 
 11f:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 126:	e8 e1 04 00 00       	call   60c <printf>
  }
 12b:	e9 25 ff ff ff       	jmp    55 <main+0x55>
 130:	e9 20 ff ff ff       	jmp    55 <main+0x55>
  printf(1, "\nwrote %d sectors\n", sectors);

  close(fd);
  fd = open("big.file", O_RDONLY);
  if(fd < 0){
    printf(2, "big: cannot re-open big.file for reading\n");
 135:	c7 44 24 04 20 0a 00 	movl   $0xa20,0x4(%esp)
 13c:	00 
 13d:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 144:	e8 c3 04 00 00       	call   60c <printf>
    exit();
 149:	e8 3e 03 00 00       	call   48c <exit>
  }
  for(i = 0; i < sectors; i++){
 14e:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
 155:	00 00 00 00 
 159:	e9 99 00 00 00       	jmp    1f7 <main+0x1f7>
    int cc = read(fd, buf, sizeof(buf));
 15e:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
 165:	00 
 166:	8d 44 24 1c          	lea    0x1c(%esp),%eax
 16a:	89 44 24 04          	mov    %eax,0x4(%esp)
 16e:	8b 84 24 24 02 00 00 	mov    0x224(%esp),%eax
 175:	89 04 24             	mov    %eax,(%esp)
 178:	e8 27 03 00 00       	call   4a4 <read>
 17d:	89 84 24 1c 02 00 00 	mov    %eax,0x21c(%esp)
    if(cc <= 0){
 184:	83 bc 24 1c 02 00 00 	cmpl   $0x0,0x21c(%esp)
 18b:	00 
 18c:	7f 24                	jg     1b2 <main+0x1b2>
      printf(2, "big: read error at sector %d\n", i);
 18e:	8b 84 24 2c 02 00 00 	mov    0x22c(%esp),%eax
 195:	89 44 24 08          	mov    %eax,0x8(%esp)
 199:	c7 44 24 04 4a 0a 00 	movl   $0xa4a,0x4(%esp)
 1a0:	00 
 1a1:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 1a8:	e8 5f 04 00 00       	call   60c <printf>
      exit();
 1ad:	e8 da 02 00 00       	call   48c <exit>
    }
    if(*(int*)buf != i){
 1b2:	8d 44 24 1c          	lea    0x1c(%esp),%eax
 1b6:	8b 00                	mov    (%eax),%eax
 1b8:	3b 84 24 2c 02 00 00 	cmp    0x22c(%esp),%eax
 1bf:	74 2e                	je     1ef <main+0x1ef>
      printf(2, "big: read the wrong data (%d) for sector %d\n",
             *(int*)buf, i);
 1c1:	8d 44 24 1c          	lea    0x1c(%esp),%eax
    if(cc <= 0){
      printf(2, "big: read error at sector %d\n", i);
      exit();
    }
    if(*(int*)buf != i){
      printf(2, "big: read the wrong data (%d) for sector %d\n",
 1c5:	8b 00                	mov    (%eax),%eax
 1c7:	8b 94 24 2c 02 00 00 	mov    0x22c(%esp),%edx
 1ce:	89 54 24 0c          	mov    %edx,0xc(%esp)
 1d2:	89 44 24 08          	mov    %eax,0x8(%esp)
 1d6:	c7 44 24 04 68 0a 00 	movl   $0xa68,0x4(%esp)
 1dd:	00 
 1de:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 1e5:	e8 22 04 00 00       	call   60c <printf>
             *(int*)buf, i);
      exit();
 1ea:	e8 9d 02 00 00       	call   48c <exit>
  fd = open("big.file", O_RDONLY);
  if(fd < 0){
    printf(2, "big: cannot re-open big.file for reading\n");
    exit();
  }
  for(i = 0; i < sectors; i++){
 1ef:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
 1f6:	01 
 1f7:	8b 84 24 2c 02 00 00 	mov    0x22c(%esp),%eax
 1fe:	3b 84 24 28 02 00 00 	cmp    0x228(%esp),%eax
 205:	0f 8c 53 ff ff ff    	jl     15e <main+0x15e>
             *(int*)buf, i);
      exit();
    }
  }

  printf(1, "done; ok\n"); 
 20b:	c7 44 24 04 95 0a 00 	movl   $0xa95,0x4(%esp)
 212:	00 
 213:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 21a:	e8 ed 03 00 00       	call   60c <printf>

  exit();
 21f:	e8 68 02 00 00       	call   48c <exit>

00000224 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 224:	55                   	push   %ebp
 225:	89 e5                	mov    %esp,%ebp
 227:	57                   	push   %edi
 228:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 229:	8b 4d 08             	mov    0x8(%ebp),%ecx
 22c:	8b 55 10             	mov    0x10(%ebp),%edx
 22f:	8b 45 0c             	mov    0xc(%ebp),%eax
 232:	89 cb                	mov    %ecx,%ebx
 234:	89 df                	mov    %ebx,%edi
 236:	89 d1                	mov    %edx,%ecx
 238:	fc                   	cld    
 239:	f3 aa                	rep stos %al,%es:(%edi)
 23b:	89 ca                	mov    %ecx,%edx
 23d:	89 fb                	mov    %edi,%ebx
 23f:	89 5d 08             	mov    %ebx,0x8(%ebp)
 242:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 245:	5b                   	pop    %ebx
 246:	5f                   	pop    %edi
 247:	5d                   	pop    %ebp
 248:	c3                   	ret    

00000249 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 249:	55                   	push   %ebp
 24a:	89 e5                	mov    %esp,%ebp
 24c:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 24f:	8b 45 08             	mov    0x8(%ebp),%eax
 252:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 255:	90                   	nop
 256:	8b 45 08             	mov    0x8(%ebp),%eax
 259:	8d 50 01             	lea    0x1(%eax),%edx
 25c:	89 55 08             	mov    %edx,0x8(%ebp)
 25f:	8b 55 0c             	mov    0xc(%ebp),%edx
 262:	8d 4a 01             	lea    0x1(%edx),%ecx
 265:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 268:	0f b6 12             	movzbl (%edx),%edx
 26b:	88 10                	mov    %dl,(%eax)
 26d:	0f b6 00             	movzbl (%eax),%eax
 270:	84 c0                	test   %al,%al
 272:	75 e2                	jne    256 <strcpy+0xd>
    ;
  return os;
 274:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 277:	c9                   	leave  
 278:	c3                   	ret    

00000279 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 279:	55                   	push   %ebp
 27a:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 27c:	eb 08                	jmp    286 <strcmp+0xd>
    p++, q++;
 27e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 282:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 286:	8b 45 08             	mov    0x8(%ebp),%eax
 289:	0f b6 00             	movzbl (%eax),%eax
 28c:	84 c0                	test   %al,%al
 28e:	74 10                	je     2a0 <strcmp+0x27>
 290:	8b 45 08             	mov    0x8(%ebp),%eax
 293:	0f b6 10             	movzbl (%eax),%edx
 296:	8b 45 0c             	mov    0xc(%ebp),%eax
 299:	0f b6 00             	movzbl (%eax),%eax
 29c:	38 c2                	cmp    %al,%dl
 29e:	74 de                	je     27e <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 2a0:	8b 45 08             	mov    0x8(%ebp),%eax
 2a3:	0f b6 00             	movzbl (%eax),%eax
 2a6:	0f b6 d0             	movzbl %al,%edx
 2a9:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ac:	0f b6 00             	movzbl (%eax),%eax
 2af:	0f b6 c0             	movzbl %al,%eax
 2b2:	29 c2                	sub    %eax,%edx
 2b4:	89 d0                	mov    %edx,%eax
}
 2b6:	5d                   	pop    %ebp
 2b7:	c3                   	ret    

000002b8 <strlen>:

uint
strlen(char *s)
{
 2b8:	55                   	push   %ebp
 2b9:	89 e5                	mov    %esp,%ebp
 2bb:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 2be:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 2c5:	eb 04                	jmp    2cb <strlen+0x13>
 2c7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 2cb:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2ce:	8b 45 08             	mov    0x8(%ebp),%eax
 2d1:	01 d0                	add    %edx,%eax
 2d3:	0f b6 00             	movzbl (%eax),%eax
 2d6:	84 c0                	test   %al,%al
 2d8:	75 ed                	jne    2c7 <strlen+0xf>
    ;
  return n;
 2da:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2dd:	c9                   	leave  
 2de:	c3                   	ret    

000002df <memset>:

void*
memset(void *dst, int c, uint n)
{
 2df:	55                   	push   %ebp
 2e0:	89 e5                	mov    %esp,%ebp
 2e2:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 2e5:	8b 45 10             	mov    0x10(%ebp),%eax
 2e8:	89 44 24 08          	mov    %eax,0x8(%esp)
 2ec:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ef:	89 44 24 04          	mov    %eax,0x4(%esp)
 2f3:	8b 45 08             	mov    0x8(%ebp),%eax
 2f6:	89 04 24             	mov    %eax,(%esp)
 2f9:	e8 26 ff ff ff       	call   224 <stosb>
  return dst;
 2fe:	8b 45 08             	mov    0x8(%ebp),%eax
}
 301:	c9                   	leave  
 302:	c3                   	ret    

00000303 <strchr>:

char*
strchr(const char *s, char c)
{
 303:	55                   	push   %ebp
 304:	89 e5                	mov    %esp,%ebp
 306:	83 ec 04             	sub    $0x4,%esp
 309:	8b 45 0c             	mov    0xc(%ebp),%eax
 30c:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 30f:	eb 14                	jmp    325 <strchr+0x22>
    if(*s == c)
 311:	8b 45 08             	mov    0x8(%ebp),%eax
 314:	0f b6 00             	movzbl (%eax),%eax
 317:	3a 45 fc             	cmp    -0x4(%ebp),%al
 31a:	75 05                	jne    321 <strchr+0x1e>
      return (char*)s;
 31c:	8b 45 08             	mov    0x8(%ebp),%eax
 31f:	eb 13                	jmp    334 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 321:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 325:	8b 45 08             	mov    0x8(%ebp),%eax
 328:	0f b6 00             	movzbl (%eax),%eax
 32b:	84 c0                	test   %al,%al
 32d:	75 e2                	jne    311 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 32f:	b8 00 00 00 00       	mov    $0x0,%eax
}
 334:	c9                   	leave  
 335:	c3                   	ret    

00000336 <gets>:

char*
gets(char *buf, int max)
{
 336:	55                   	push   %ebp
 337:	89 e5                	mov    %esp,%ebp
 339:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 33c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 343:	eb 4c                	jmp    391 <gets+0x5b>
    cc = read(0, &c, 1);
 345:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 34c:	00 
 34d:	8d 45 ef             	lea    -0x11(%ebp),%eax
 350:	89 44 24 04          	mov    %eax,0x4(%esp)
 354:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 35b:	e8 44 01 00 00       	call   4a4 <read>
 360:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 363:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 367:	7f 02                	jg     36b <gets+0x35>
      break;
 369:	eb 31                	jmp    39c <gets+0x66>
    buf[i++] = c;
 36b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 36e:	8d 50 01             	lea    0x1(%eax),%edx
 371:	89 55 f4             	mov    %edx,-0xc(%ebp)
 374:	89 c2                	mov    %eax,%edx
 376:	8b 45 08             	mov    0x8(%ebp),%eax
 379:	01 c2                	add    %eax,%edx
 37b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 37f:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 381:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 385:	3c 0a                	cmp    $0xa,%al
 387:	74 13                	je     39c <gets+0x66>
 389:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 38d:	3c 0d                	cmp    $0xd,%al
 38f:	74 0b                	je     39c <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 391:	8b 45 f4             	mov    -0xc(%ebp),%eax
 394:	83 c0 01             	add    $0x1,%eax
 397:	3b 45 0c             	cmp    0xc(%ebp),%eax
 39a:	7c a9                	jl     345 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 39c:	8b 55 f4             	mov    -0xc(%ebp),%edx
 39f:	8b 45 08             	mov    0x8(%ebp),%eax
 3a2:	01 d0                	add    %edx,%eax
 3a4:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 3a7:	8b 45 08             	mov    0x8(%ebp),%eax
}
 3aa:	c9                   	leave  
 3ab:	c3                   	ret    

000003ac <stat>:

int
stat(char *n, struct stat *st)
{
 3ac:	55                   	push   %ebp
 3ad:	89 e5                	mov    %esp,%ebp
 3af:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3b2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 3b9:	00 
 3ba:	8b 45 08             	mov    0x8(%ebp),%eax
 3bd:	89 04 24             	mov    %eax,(%esp)
 3c0:	e8 07 01 00 00       	call   4cc <open>
 3c5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 3c8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 3cc:	79 07                	jns    3d5 <stat+0x29>
    return -1;
 3ce:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3d3:	eb 23                	jmp    3f8 <stat+0x4c>
  r = fstat(fd, st);
 3d5:	8b 45 0c             	mov    0xc(%ebp),%eax
 3d8:	89 44 24 04          	mov    %eax,0x4(%esp)
 3dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3df:	89 04 24             	mov    %eax,(%esp)
 3e2:	e8 fd 00 00 00       	call   4e4 <fstat>
 3e7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 3ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3ed:	89 04 24             	mov    %eax,(%esp)
 3f0:	e8 bf 00 00 00       	call   4b4 <close>
  return r;
 3f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 3f8:	c9                   	leave  
 3f9:	c3                   	ret    

000003fa <atoi>:

int
atoi(const char *s)
{
 3fa:	55                   	push   %ebp
 3fb:	89 e5                	mov    %esp,%ebp
 3fd:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 400:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 407:	eb 25                	jmp    42e <atoi+0x34>
    n = n*10 + *s++ - '0';
 409:	8b 55 fc             	mov    -0x4(%ebp),%edx
 40c:	89 d0                	mov    %edx,%eax
 40e:	c1 e0 02             	shl    $0x2,%eax
 411:	01 d0                	add    %edx,%eax
 413:	01 c0                	add    %eax,%eax
 415:	89 c1                	mov    %eax,%ecx
 417:	8b 45 08             	mov    0x8(%ebp),%eax
 41a:	8d 50 01             	lea    0x1(%eax),%edx
 41d:	89 55 08             	mov    %edx,0x8(%ebp)
 420:	0f b6 00             	movzbl (%eax),%eax
 423:	0f be c0             	movsbl %al,%eax
 426:	01 c8                	add    %ecx,%eax
 428:	83 e8 30             	sub    $0x30,%eax
 42b:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 42e:	8b 45 08             	mov    0x8(%ebp),%eax
 431:	0f b6 00             	movzbl (%eax),%eax
 434:	3c 2f                	cmp    $0x2f,%al
 436:	7e 0a                	jle    442 <atoi+0x48>
 438:	8b 45 08             	mov    0x8(%ebp),%eax
 43b:	0f b6 00             	movzbl (%eax),%eax
 43e:	3c 39                	cmp    $0x39,%al
 440:	7e c7                	jle    409 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 442:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 445:	c9                   	leave  
 446:	c3                   	ret    

00000447 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 447:	55                   	push   %ebp
 448:	89 e5                	mov    %esp,%ebp
 44a:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 44d:	8b 45 08             	mov    0x8(%ebp),%eax
 450:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 453:	8b 45 0c             	mov    0xc(%ebp),%eax
 456:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 459:	eb 17                	jmp    472 <memmove+0x2b>
    *dst++ = *src++;
 45b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 45e:	8d 50 01             	lea    0x1(%eax),%edx
 461:	89 55 fc             	mov    %edx,-0x4(%ebp)
 464:	8b 55 f8             	mov    -0x8(%ebp),%edx
 467:	8d 4a 01             	lea    0x1(%edx),%ecx
 46a:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 46d:	0f b6 12             	movzbl (%edx),%edx
 470:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 472:	8b 45 10             	mov    0x10(%ebp),%eax
 475:	8d 50 ff             	lea    -0x1(%eax),%edx
 478:	89 55 10             	mov    %edx,0x10(%ebp)
 47b:	85 c0                	test   %eax,%eax
 47d:	7f dc                	jg     45b <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 47f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 482:	c9                   	leave  
 483:	c3                   	ret    

00000484 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 484:	b8 01 00 00 00       	mov    $0x1,%eax
 489:	cd 40                	int    $0x40
 48b:	c3                   	ret    

0000048c <exit>:
SYSCALL(exit)
 48c:	b8 02 00 00 00       	mov    $0x2,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <wait>:
SYSCALL(wait)
 494:	b8 03 00 00 00       	mov    $0x3,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <pipe>:
SYSCALL(pipe)
 49c:	b8 04 00 00 00       	mov    $0x4,%eax
 4a1:	cd 40                	int    $0x40
 4a3:	c3                   	ret    

000004a4 <read>:
SYSCALL(read)
 4a4:	b8 05 00 00 00       	mov    $0x5,%eax
 4a9:	cd 40                	int    $0x40
 4ab:	c3                   	ret    

000004ac <write>:
SYSCALL(write)
 4ac:	b8 10 00 00 00       	mov    $0x10,%eax
 4b1:	cd 40                	int    $0x40
 4b3:	c3                   	ret    

000004b4 <close>:
SYSCALL(close)
 4b4:	b8 15 00 00 00       	mov    $0x15,%eax
 4b9:	cd 40                	int    $0x40
 4bb:	c3                   	ret    

000004bc <kill>:
SYSCALL(kill)
 4bc:	b8 06 00 00 00       	mov    $0x6,%eax
 4c1:	cd 40                	int    $0x40
 4c3:	c3                   	ret    

000004c4 <exec>:
SYSCALL(exec)
 4c4:	b8 07 00 00 00       	mov    $0x7,%eax
 4c9:	cd 40                	int    $0x40
 4cb:	c3                   	ret    

000004cc <open>:
SYSCALL(open)
 4cc:	b8 0f 00 00 00       	mov    $0xf,%eax
 4d1:	cd 40                	int    $0x40
 4d3:	c3                   	ret    

000004d4 <mknod>:
SYSCALL(mknod)
 4d4:	b8 11 00 00 00       	mov    $0x11,%eax
 4d9:	cd 40                	int    $0x40
 4db:	c3                   	ret    

000004dc <unlink>:
SYSCALL(unlink)
 4dc:	b8 12 00 00 00       	mov    $0x12,%eax
 4e1:	cd 40                	int    $0x40
 4e3:	c3                   	ret    

000004e4 <fstat>:
SYSCALL(fstat)
 4e4:	b8 08 00 00 00       	mov    $0x8,%eax
 4e9:	cd 40                	int    $0x40
 4eb:	c3                   	ret    

000004ec <link>:
SYSCALL(link)
 4ec:	b8 13 00 00 00       	mov    $0x13,%eax
 4f1:	cd 40                	int    $0x40
 4f3:	c3                   	ret    

000004f4 <mkdir>:
SYSCALL(mkdir)
 4f4:	b8 14 00 00 00       	mov    $0x14,%eax
 4f9:	cd 40                	int    $0x40
 4fb:	c3                   	ret    

000004fc <chdir>:
SYSCALL(chdir)
 4fc:	b8 09 00 00 00       	mov    $0x9,%eax
 501:	cd 40                	int    $0x40
 503:	c3                   	ret    

00000504 <dup>:
SYSCALL(dup)
 504:	b8 0a 00 00 00       	mov    $0xa,%eax
 509:	cd 40                	int    $0x40
 50b:	c3                   	ret    

0000050c <getpid>:
SYSCALL(getpid)
 50c:	b8 0b 00 00 00       	mov    $0xb,%eax
 511:	cd 40                	int    $0x40
 513:	c3                   	ret    

00000514 <sbrk>:
SYSCALL(sbrk)
 514:	b8 0c 00 00 00       	mov    $0xc,%eax
 519:	cd 40                	int    $0x40
 51b:	c3                   	ret    

0000051c <sleep>:
SYSCALL(sleep)
 51c:	b8 0d 00 00 00       	mov    $0xd,%eax
 521:	cd 40                	int    $0x40
 523:	c3                   	ret    

00000524 <uptime>:
SYSCALL(uptime)
 524:	b8 0e 00 00 00       	mov    $0xe,%eax
 529:	cd 40                	int    $0x40
 52b:	c3                   	ret    

0000052c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 52c:	55                   	push   %ebp
 52d:	89 e5                	mov    %esp,%ebp
 52f:	83 ec 18             	sub    $0x18,%esp
 532:	8b 45 0c             	mov    0xc(%ebp),%eax
 535:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 538:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 53f:	00 
 540:	8d 45 f4             	lea    -0xc(%ebp),%eax
 543:	89 44 24 04          	mov    %eax,0x4(%esp)
 547:	8b 45 08             	mov    0x8(%ebp),%eax
 54a:	89 04 24             	mov    %eax,(%esp)
 54d:	e8 5a ff ff ff       	call   4ac <write>
}
 552:	c9                   	leave  
 553:	c3                   	ret    

00000554 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 554:	55                   	push   %ebp
 555:	89 e5                	mov    %esp,%ebp
 557:	56                   	push   %esi
 558:	53                   	push   %ebx
 559:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 55c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 563:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 567:	74 17                	je     580 <printint+0x2c>
 569:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 56d:	79 11                	jns    580 <printint+0x2c>
    neg = 1;
 56f:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 576:	8b 45 0c             	mov    0xc(%ebp),%eax
 579:	f7 d8                	neg    %eax
 57b:	89 45 ec             	mov    %eax,-0x14(%ebp)
 57e:	eb 06                	jmp    586 <printint+0x32>
  } else {
    x = xx;
 580:	8b 45 0c             	mov    0xc(%ebp),%eax
 583:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 586:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 58d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 590:	8d 41 01             	lea    0x1(%ecx),%eax
 593:	89 45 f4             	mov    %eax,-0xc(%ebp)
 596:	8b 5d 10             	mov    0x10(%ebp),%ebx
 599:	8b 45 ec             	mov    -0x14(%ebp),%eax
 59c:	ba 00 00 00 00       	mov    $0x0,%edx
 5a1:	f7 f3                	div    %ebx
 5a3:	89 d0                	mov    %edx,%eax
 5a5:	0f b6 80 ec 0c 00 00 	movzbl 0xcec(%eax),%eax
 5ac:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 5b0:	8b 75 10             	mov    0x10(%ebp),%esi
 5b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5b6:	ba 00 00 00 00       	mov    $0x0,%edx
 5bb:	f7 f6                	div    %esi
 5bd:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5c0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5c4:	75 c7                	jne    58d <printint+0x39>
  if(neg)
 5c6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5ca:	74 10                	je     5dc <printint+0x88>
    buf[i++] = '-';
 5cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5cf:	8d 50 01             	lea    0x1(%eax),%edx
 5d2:	89 55 f4             	mov    %edx,-0xc(%ebp)
 5d5:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 5da:	eb 1f                	jmp    5fb <printint+0xa7>
 5dc:	eb 1d                	jmp    5fb <printint+0xa7>
    putc(fd, buf[i]);
 5de:	8d 55 dc             	lea    -0x24(%ebp),%edx
 5e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5e4:	01 d0                	add    %edx,%eax
 5e6:	0f b6 00             	movzbl (%eax),%eax
 5e9:	0f be c0             	movsbl %al,%eax
 5ec:	89 44 24 04          	mov    %eax,0x4(%esp)
 5f0:	8b 45 08             	mov    0x8(%ebp),%eax
 5f3:	89 04 24             	mov    %eax,(%esp)
 5f6:	e8 31 ff ff ff       	call   52c <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 5fb:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 5ff:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 603:	79 d9                	jns    5de <printint+0x8a>
    putc(fd, buf[i]);
}
 605:	83 c4 30             	add    $0x30,%esp
 608:	5b                   	pop    %ebx
 609:	5e                   	pop    %esi
 60a:	5d                   	pop    %ebp
 60b:	c3                   	ret    

0000060c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 60c:	55                   	push   %ebp
 60d:	89 e5                	mov    %esp,%ebp
 60f:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 612:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 619:	8d 45 0c             	lea    0xc(%ebp),%eax
 61c:	83 c0 04             	add    $0x4,%eax
 61f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 622:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 629:	e9 7c 01 00 00       	jmp    7aa <printf+0x19e>
    c = fmt[i] & 0xff;
 62e:	8b 55 0c             	mov    0xc(%ebp),%edx
 631:	8b 45 f0             	mov    -0x10(%ebp),%eax
 634:	01 d0                	add    %edx,%eax
 636:	0f b6 00             	movzbl (%eax),%eax
 639:	0f be c0             	movsbl %al,%eax
 63c:	25 ff 00 00 00       	and    $0xff,%eax
 641:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 644:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 648:	75 2c                	jne    676 <printf+0x6a>
      if(c == '%'){
 64a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 64e:	75 0c                	jne    65c <printf+0x50>
        state = '%';
 650:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 657:	e9 4a 01 00 00       	jmp    7a6 <printf+0x19a>
      } else {
        putc(fd, c);
 65c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 65f:	0f be c0             	movsbl %al,%eax
 662:	89 44 24 04          	mov    %eax,0x4(%esp)
 666:	8b 45 08             	mov    0x8(%ebp),%eax
 669:	89 04 24             	mov    %eax,(%esp)
 66c:	e8 bb fe ff ff       	call   52c <putc>
 671:	e9 30 01 00 00       	jmp    7a6 <printf+0x19a>
      }
    } else if(state == '%'){
 676:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 67a:	0f 85 26 01 00 00    	jne    7a6 <printf+0x19a>
      if(c == 'd'){
 680:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 684:	75 2d                	jne    6b3 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 686:	8b 45 e8             	mov    -0x18(%ebp),%eax
 689:	8b 00                	mov    (%eax),%eax
 68b:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 692:	00 
 693:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 69a:	00 
 69b:	89 44 24 04          	mov    %eax,0x4(%esp)
 69f:	8b 45 08             	mov    0x8(%ebp),%eax
 6a2:	89 04 24             	mov    %eax,(%esp)
 6a5:	e8 aa fe ff ff       	call   554 <printint>
        ap++;
 6aa:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6ae:	e9 ec 00 00 00       	jmp    79f <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 6b3:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 6b7:	74 06                	je     6bf <printf+0xb3>
 6b9:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 6bd:	75 2d                	jne    6ec <printf+0xe0>
        printint(fd, *ap, 16, 0);
 6bf:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6c2:	8b 00                	mov    (%eax),%eax
 6c4:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 6cb:	00 
 6cc:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 6d3:	00 
 6d4:	89 44 24 04          	mov    %eax,0x4(%esp)
 6d8:	8b 45 08             	mov    0x8(%ebp),%eax
 6db:	89 04 24             	mov    %eax,(%esp)
 6de:	e8 71 fe ff ff       	call   554 <printint>
        ap++;
 6e3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6e7:	e9 b3 00 00 00       	jmp    79f <printf+0x193>
      } else if(c == 's'){
 6ec:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 6f0:	75 45                	jne    737 <printf+0x12b>
        s = (char*)*ap;
 6f2:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6f5:	8b 00                	mov    (%eax),%eax
 6f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 6fa:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 6fe:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 702:	75 09                	jne    70d <printf+0x101>
          s = "(null)";
 704:	c7 45 f4 9f 0a 00 00 	movl   $0xa9f,-0xc(%ebp)
        while(*s != 0){
 70b:	eb 1e                	jmp    72b <printf+0x11f>
 70d:	eb 1c                	jmp    72b <printf+0x11f>
          putc(fd, *s);
 70f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 712:	0f b6 00             	movzbl (%eax),%eax
 715:	0f be c0             	movsbl %al,%eax
 718:	89 44 24 04          	mov    %eax,0x4(%esp)
 71c:	8b 45 08             	mov    0x8(%ebp),%eax
 71f:	89 04 24             	mov    %eax,(%esp)
 722:	e8 05 fe ff ff       	call   52c <putc>
          s++;
 727:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 72b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 72e:	0f b6 00             	movzbl (%eax),%eax
 731:	84 c0                	test   %al,%al
 733:	75 da                	jne    70f <printf+0x103>
 735:	eb 68                	jmp    79f <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 737:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 73b:	75 1d                	jne    75a <printf+0x14e>
        putc(fd, *ap);
 73d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 740:	8b 00                	mov    (%eax),%eax
 742:	0f be c0             	movsbl %al,%eax
 745:	89 44 24 04          	mov    %eax,0x4(%esp)
 749:	8b 45 08             	mov    0x8(%ebp),%eax
 74c:	89 04 24             	mov    %eax,(%esp)
 74f:	e8 d8 fd ff ff       	call   52c <putc>
        ap++;
 754:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 758:	eb 45                	jmp    79f <printf+0x193>
      } else if(c == '%'){
 75a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 75e:	75 17                	jne    777 <printf+0x16b>
        putc(fd, c);
 760:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 763:	0f be c0             	movsbl %al,%eax
 766:	89 44 24 04          	mov    %eax,0x4(%esp)
 76a:	8b 45 08             	mov    0x8(%ebp),%eax
 76d:	89 04 24             	mov    %eax,(%esp)
 770:	e8 b7 fd ff ff       	call   52c <putc>
 775:	eb 28                	jmp    79f <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 777:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 77e:	00 
 77f:	8b 45 08             	mov    0x8(%ebp),%eax
 782:	89 04 24             	mov    %eax,(%esp)
 785:	e8 a2 fd ff ff       	call   52c <putc>
        putc(fd, c);
 78a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 78d:	0f be c0             	movsbl %al,%eax
 790:	89 44 24 04          	mov    %eax,0x4(%esp)
 794:	8b 45 08             	mov    0x8(%ebp),%eax
 797:	89 04 24             	mov    %eax,(%esp)
 79a:	e8 8d fd ff ff       	call   52c <putc>
      }
      state = 0;
 79f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7a6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 7aa:	8b 55 0c             	mov    0xc(%ebp),%edx
 7ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7b0:	01 d0                	add    %edx,%eax
 7b2:	0f b6 00             	movzbl (%eax),%eax
 7b5:	84 c0                	test   %al,%al
 7b7:	0f 85 71 fe ff ff    	jne    62e <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 7bd:	c9                   	leave  
 7be:	c3                   	ret    

000007bf <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7bf:	55                   	push   %ebp
 7c0:	89 e5                	mov    %esp,%ebp
 7c2:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7c5:	8b 45 08             	mov    0x8(%ebp),%eax
 7c8:	83 e8 08             	sub    $0x8,%eax
 7cb:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7ce:	a1 08 0d 00 00       	mov    0xd08,%eax
 7d3:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7d6:	eb 24                	jmp    7fc <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7d8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7db:	8b 00                	mov    (%eax),%eax
 7dd:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7e0:	77 12                	ja     7f4 <free+0x35>
 7e2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e5:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7e8:	77 24                	ja     80e <free+0x4f>
 7ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ed:	8b 00                	mov    (%eax),%eax
 7ef:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7f2:	77 1a                	ja     80e <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f7:	8b 00                	mov    (%eax),%eax
 7f9:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7fc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ff:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 802:	76 d4                	jbe    7d8 <free+0x19>
 804:	8b 45 fc             	mov    -0x4(%ebp),%eax
 807:	8b 00                	mov    (%eax),%eax
 809:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 80c:	76 ca                	jbe    7d8 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 80e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 811:	8b 40 04             	mov    0x4(%eax),%eax
 814:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 81b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 81e:	01 c2                	add    %eax,%edx
 820:	8b 45 fc             	mov    -0x4(%ebp),%eax
 823:	8b 00                	mov    (%eax),%eax
 825:	39 c2                	cmp    %eax,%edx
 827:	75 24                	jne    84d <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 829:	8b 45 f8             	mov    -0x8(%ebp),%eax
 82c:	8b 50 04             	mov    0x4(%eax),%edx
 82f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 832:	8b 00                	mov    (%eax),%eax
 834:	8b 40 04             	mov    0x4(%eax),%eax
 837:	01 c2                	add    %eax,%edx
 839:	8b 45 f8             	mov    -0x8(%ebp),%eax
 83c:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 83f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 842:	8b 00                	mov    (%eax),%eax
 844:	8b 10                	mov    (%eax),%edx
 846:	8b 45 f8             	mov    -0x8(%ebp),%eax
 849:	89 10                	mov    %edx,(%eax)
 84b:	eb 0a                	jmp    857 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 84d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 850:	8b 10                	mov    (%eax),%edx
 852:	8b 45 f8             	mov    -0x8(%ebp),%eax
 855:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 857:	8b 45 fc             	mov    -0x4(%ebp),%eax
 85a:	8b 40 04             	mov    0x4(%eax),%eax
 85d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 864:	8b 45 fc             	mov    -0x4(%ebp),%eax
 867:	01 d0                	add    %edx,%eax
 869:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 86c:	75 20                	jne    88e <free+0xcf>
    p->s.size += bp->s.size;
 86e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 871:	8b 50 04             	mov    0x4(%eax),%edx
 874:	8b 45 f8             	mov    -0x8(%ebp),%eax
 877:	8b 40 04             	mov    0x4(%eax),%eax
 87a:	01 c2                	add    %eax,%edx
 87c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 87f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 882:	8b 45 f8             	mov    -0x8(%ebp),%eax
 885:	8b 10                	mov    (%eax),%edx
 887:	8b 45 fc             	mov    -0x4(%ebp),%eax
 88a:	89 10                	mov    %edx,(%eax)
 88c:	eb 08                	jmp    896 <free+0xd7>
  } else
    p->s.ptr = bp;
 88e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 891:	8b 55 f8             	mov    -0x8(%ebp),%edx
 894:	89 10                	mov    %edx,(%eax)
  freep = p;
 896:	8b 45 fc             	mov    -0x4(%ebp),%eax
 899:	a3 08 0d 00 00       	mov    %eax,0xd08
}
 89e:	c9                   	leave  
 89f:	c3                   	ret    

000008a0 <morecore>:

static Header*
morecore(uint nu)
{
 8a0:	55                   	push   %ebp
 8a1:	89 e5                	mov    %esp,%ebp
 8a3:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 8a6:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 8ad:	77 07                	ja     8b6 <morecore+0x16>
    nu = 4096;
 8af:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 8b6:	8b 45 08             	mov    0x8(%ebp),%eax
 8b9:	c1 e0 03             	shl    $0x3,%eax
 8bc:	89 04 24             	mov    %eax,(%esp)
 8bf:	e8 50 fc ff ff       	call   514 <sbrk>
 8c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 8c7:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 8cb:	75 07                	jne    8d4 <morecore+0x34>
    return 0;
 8cd:	b8 00 00 00 00       	mov    $0x0,%eax
 8d2:	eb 22                	jmp    8f6 <morecore+0x56>
  hp = (Header*)p;
 8d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 8da:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8dd:	8b 55 08             	mov    0x8(%ebp),%edx
 8e0:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 8e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8e6:	83 c0 08             	add    $0x8,%eax
 8e9:	89 04 24             	mov    %eax,(%esp)
 8ec:	e8 ce fe ff ff       	call   7bf <free>
  return freep;
 8f1:	a1 08 0d 00 00       	mov    0xd08,%eax
}
 8f6:	c9                   	leave  
 8f7:	c3                   	ret    

000008f8 <malloc>:

void*
malloc(uint nbytes)
{
 8f8:	55                   	push   %ebp
 8f9:	89 e5                	mov    %esp,%ebp
 8fb:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8fe:	8b 45 08             	mov    0x8(%ebp),%eax
 901:	83 c0 07             	add    $0x7,%eax
 904:	c1 e8 03             	shr    $0x3,%eax
 907:	83 c0 01             	add    $0x1,%eax
 90a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 90d:	a1 08 0d 00 00       	mov    0xd08,%eax
 912:	89 45 f0             	mov    %eax,-0x10(%ebp)
 915:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 919:	75 23                	jne    93e <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 91b:	c7 45 f0 00 0d 00 00 	movl   $0xd00,-0x10(%ebp)
 922:	8b 45 f0             	mov    -0x10(%ebp),%eax
 925:	a3 08 0d 00 00       	mov    %eax,0xd08
 92a:	a1 08 0d 00 00       	mov    0xd08,%eax
 92f:	a3 00 0d 00 00       	mov    %eax,0xd00
    base.s.size = 0;
 934:	c7 05 04 0d 00 00 00 	movl   $0x0,0xd04
 93b:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 93e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 941:	8b 00                	mov    (%eax),%eax
 943:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 946:	8b 45 f4             	mov    -0xc(%ebp),%eax
 949:	8b 40 04             	mov    0x4(%eax),%eax
 94c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 94f:	72 4d                	jb     99e <malloc+0xa6>
      if(p->s.size == nunits)
 951:	8b 45 f4             	mov    -0xc(%ebp),%eax
 954:	8b 40 04             	mov    0x4(%eax),%eax
 957:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 95a:	75 0c                	jne    968 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 95c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 95f:	8b 10                	mov    (%eax),%edx
 961:	8b 45 f0             	mov    -0x10(%ebp),%eax
 964:	89 10                	mov    %edx,(%eax)
 966:	eb 26                	jmp    98e <malloc+0x96>
      else {
        p->s.size -= nunits;
 968:	8b 45 f4             	mov    -0xc(%ebp),%eax
 96b:	8b 40 04             	mov    0x4(%eax),%eax
 96e:	2b 45 ec             	sub    -0x14(%ebp),%eax
 971:	89 c2                	mov    %eax,%edx
 973:	8b 45 f4             	mov    -0xc(%ebp),%eax
 976:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 979:	8b 45 f4             	mov    -0xc(%ebp),%eax
 97c:	8b 40 04             	mov    0x4(%eax),%eax
 97f:	c1 e0 03             	shl    $0x3,%eax
 982:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 985:	8b 45 f4             	mov    -0xc(%ebp),%eax
 988:	8b 55 ec             	mov    -0x14(%ebp),%edx
 98b:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 98e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 991:	a3 08 0d 00 00       	mov    %eax,0xd08
      return (void*)(p + 1);
 996:	8b 45 f4             	mov    -0xc(%ebp),%eax
 999:	83 c0 08             	add    $0x8,%eax
 99c:	eb 38                	jmp    9d6 <malloc+0xde>
    }
    if(p == freep)
 99e:	a1 08 0d 00 00       	mov    0xd08,%eax
 9a3:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 9a6:	75 1b                	jne    9c3 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 9a8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 9ab:	89 04 24             	mov    %eax,(%esp)
 9ae:	e8 ed fe ff ff       	call   8a0 <morecore>
 9b3:	89 45 f4             	mov    %eax,-0xc(%ebp)
 9b6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 9ba:	75 07                	jne    9c3 <malloc+0xcb>
        return 0;
 9bc:	b8 00 00 00 00       	mov    $0x0,%eax
 9c1:	eb 13                	jmp    9d6 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9c6:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9cc:	8b 00                	mov    (%eax),%eax
 9ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 9d1:	e9 70 ff ff ff       	jmp    946 <malloc+0x4e>
}
 9d6:	c9                   	leave  
 9d7:	c3                   	ret    
