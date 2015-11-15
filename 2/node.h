#include <string.h>
#include <stdlib.h>
#include <memory.h>

int parent_count;

typedef struct tagNode *Node;
struct tagNode {
    char *op;
    Node left;
    Node right;
};

struct tagNode* make_node(char *_op, void *_left, void *_right) {
    struct tagNode *st = malloc(sizeof(struct tagNode));
    st->op = NULL;
    st->left = NULL;
    st->right = NULL;

    if (st == NULL) {
        return NULL;
    }

    st->op = malloc((strlen(_op)+1)*sizeof(char));
    if (st->op == NULL) {
        free(st);
        return NULL;
    }
    strcpy(st->op, _op);

    st->left = _left;
    st->right = _right;
    return st;
}

void printTree(struct tagNode *root) {
    if (root != NULL) {
        printf("%s", root->op);
        if (root->left != NULL || root->right != NULL) {
            printf("(");
        }

        if (root->left != NULL || !strcmp(root->op, "Paren")) {
            if (root->left != NULL) {
                printTree(root->left);
            } else {
                printf("%d", ++parent_count);
            }
        }
        if (root->right != NULL) {
            printf(", ");
            printTree(root->right);
        }

        if (root->left != NULL || root->right != NULL) {
            printf(")");
        }
    }
    return;
}

