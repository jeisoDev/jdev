# Contribuindo com o jsec

Obrigado por querer ajudar! 🙌 O `jsec` é um projeto da comunidade, feito para
ensinar ferramentas de segurança em **português**, de forma didática. Toda
contribuição — uma ficha nova, uma correção de texto ou uma melhoria no código —
é muito bem-vinda.

## Formas de contribuir

- **Adicionar uma ferramenta** (a forma mais útil!).
- **Melhorar uma ficha existente** (corrigir, atualizar flags, melhorar o fluxo).
- **Corrigir erros** de português, exemplos ou links.
- **Melhorar o código** do `jsec` ou do instalador.

## Adicionando uma ficha nova

Não é preciso mexer na lógica do `jsec`. Basta criar um arquivo na pasta `fichas/`:

1. Copie o modelo:
   ```bash
   cp fichas/_modelo.ficha fichas/<ferramenta>.ficha
   ```
2. Preencha os campos. O **nome do arquivo** (sem `.ficha`) é como a ferramenta
   será chamada (ex.: `fichas/nmap.ficha` → `jsec nmap`).
3. Teste localmente:
   ```bash
   ./jsec <ferramenta>
   ```
4. Abra um Pull Request.

### Campos de uma ficha

| Campo        | Obrigatório | Descrição                                               |
|--------------|:-----------:|---------------------------------------------------------|
| `NOME`       |     sim     | Nome exibido da ferramenta.                             |
| `CATEGORIA`  |     sim     | Categoria (ex.: `Brute force (autenticação)`).          |
| `DESC`       |     sim     | O que faz e para que serve.                             |
| `EXEMPLO`    |     sim     | Um comando real, com `<placeholders>` claros.           |
| `PASSOS`     |     sim     | Explicação de cada parte/flag do exemplo.               |
| `DICA`       |     sim     | Uma dica de uso ou um erro comum a evitar.              |
| `ALIASES`    |   opcional  | Outros nomes aceitos, separados por espaço.             |
| `FLUXO`      |   opcional  | Fluxo de uso ponta a ponta. Linhas com `$ ` viram comando. |
| `VER_TAMBEM` |   opcional  | Ferramentas relacionadas.                               |

## Padrões de qualidade

- **Português claro e didático** — o público são iniciantes.
- Prefira **exemplos reais** com `<placeholders>` em vez de valores fixos.
- Sempre que a ferramenta for ofensiva, reforce o uso **autorizado** na dica.
- Mantenha a indentação e o estilo do código existente.

## Validando antes do PR

O projeto roda validação automática, mas você pode checar localmente:

```bash
# todas as fichas e scripts devem ter sintaxe válida
for f in fichas/*.ficha; do bash -n "$f"; done
bash -n jsec
bash -n install.sh

# (opcional) análise estática, se tiver o shellcheck instalado
shellcheck jsec install.sh
```

## Código de conduta

Seja gentil e respeitoso. Este é um espaço de aprendizado para quem está
começando. Explique com paciência e assuma a boa-fé das pessoas.
