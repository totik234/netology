1. Найдите полный хеш и комментарий коммита, хеш которого начинается на `aefea`.
- **Ответ**: Искал коммандой `git show aefea`. Полный хеш `aefead2207ef7e2aa5dc81a34aedf0cad4c32545`
2. Какому тегу соответствует коммит `85024d3`?
- **Ответ**: Искал командой `git show 85024d3`. Коммиту `85024d3` соответствует тег - `tag: v0.12.23`
3. Сколько родителей у коммита `b8d720`? Напишите их хеши.
- **Ответ**: Искал командой `git show -s --pretty=%P b8d720`. Это merge коммит у него два родителя `56cd7859e05c36c06b56d013b55a252d0bb7e158` `9ea88f22fc6269854151c571162c5bcf958bee2b`
4. Перечислите хеши и комментарии всех коммитов которые были сделаны между тегами `v0.12.23` и `v0.12.24`.
- **Ответ**: Искал командой `git log --pretty=oneline  v0.12.23^..v0.12.24`, что бы увидеть только коммиты между тегами тогда комманда будет такой `git log --pretty=oneline v0.12.23..v0.12.24^`
```console
33ff1c03bb960b332be3af2e333462dde88b279e (tag: v0.12.24) v0.12.24
b14b74c4939dcab573326f4e3ee2a62e23e12f89 [Website] vmc provider links
3f235065b9347a758efadc92295b540ee0a5e26e Update CHANGELOG.md
6ae64e247b332925b872447e9ce869657281c2bf registry: Fix panic when server is unreachable
5c619ca1baf2e21a155fcdb4c264cc9e24a2a353 website: Remove links to the getting started guide's old location
06275647e2b53d97d4f0a19a0fec11f6d69820b5 Update CHANGELOG.md
d5f9411f5108260320064349b757f55c09bc4b80 command: Fix bug when using terraform login on Windows
4b6d06cc5dcb78af637bbb19c198faff37a066ed Update CHANGELOG.md
dd01a35078f040ca984cdd349f18d0b67e486c35 Update CHANGELOG.md
225466bc3e5f35baa5d07197bbc079345b77525e Cleanup after v0.12.23 release
85024d3100126de36331c6982bfaac02cdab9e76 (tag: v0.12.23) v0.12.23
```
5. Найдите коммит в котором была создана функция func providerSource, ее определение в коде выглядит так func providerSource(...) (вместо троеточия перечислены аргументы).
- **Ответ**: Искал коммандой `git log --pretty=oneline -S "func providerSource("` коммит в котором была создана функция  
`8c928e83589d90a031f811fae52a81be7153e82f`
6. Найдите все коммиты в которых была изменена функция `globalPluginDirs`.
- **Ответ**: Искал командой `git log --pretty=oneline -S "func globalPluginDirs("`,присутствут единсвенный коммит, в котором данная функция была создана и на данный момент не изменялась, `8364383c359a6b738a436d1b7745ccdce178df47`
7. Кто автор функции `synchronizedWriters`?
- **Ответ**: Искал командой `git log --pretty=format:"%H %an %ad" -S "func synchronizedWriters("`. Атором функции является *Martin Atkins* первый коммит под его авторством `5ac311e2a91e381e2f52234668b49ba670aa0fe5`. В последующем в данную функцию вносил изменения другой автор *James Bardin* коммит `bdfea50cc85161dea41be0fe3381fd98731ff786`